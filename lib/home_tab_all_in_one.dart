// ================================
// home_tab_all_in_one.dart
// ONE FILE ONLY - Full runnable example for Home Tab
// ================================

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ================================
// 1) ENTRY POINT (main)
// ================================
void main() {
  runApp(const MyApp());
}

// ================================
// 2) APP ROOT (MyApp -> MaterialApp)
// ================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeTabScreen(),
    );
  }
}

// ================================
// 3) HOME TAB SCREEN (UI)
// ================================
class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final MoviesApiService _api = MoviesApiService();

  bool _loading = false;
  String? _error;
  List<MovieModel> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final data = await _api.fetchMovies();
      setState(() => _movies = data);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Tab'),
        actions: [
          IconButton(
            onPressed: _loadMovies,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Error: $_error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _loadMovies,
              child: const Text('Try again'),
            )
          ],
        ),
      );
    }

    if (_movies.isEmpty) {
      return const Center(child: Text('No movies found.'));
    }

    return ListView.separated(
      itemCount: _movies.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final m = _movies[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                (m.title.isNotEmpty ? m.title[0] : '?').toUpperCase(),
              ),
            ),
            title: Text(m.title),
            subtitle: Text('Rating: ${m.rating}'),
          ),
        );
      },
    );
  }
}

// ================================
// 4) MOVIE MODEL
// ================================
class MovieModel {
  final String title;
  final double rating;

  MovieModel({
    required this.title,
    required this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final rawTitle = json['title'] ?? json['name'] ?? 'Untitled';
    final rawRating = json['rating'] ?? json['vote_average'] ?? 0;

    return MovieModel(
      title: rawTitle.toString(),
      rating: _toDouble(rawRating),
    );
  }

  static double _toDouble(dynamic v) {
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }
}

// ================================
// 5) API SERVICE
// ================================
// NOTE:
// - Replace _url with your real endpoint.
// - If your API needs headers/token, add them in http.get(...)
class MoviesApiService {
  // غيري اللينك ده باللينك الحقيقي بتاعك
  final String _url = 'https://example.com/api/movies';

  Future<List<MovieModel>> fetchMovies() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load movies. Code: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);

    // Supports:
    // 1) { "data": { "movies": [ ... ] } }
    // 2) { "movies": [ ... ] }
    // 3) [ ... ]
    List<dynamic> list;

    if (decoded is List) {
      list = decoded;
    } else if (decoded is Map<String, dynamic>) {
      final data = decoded['data'];
      if (data is Map && data['movies'] is List) {
        list = data['movies'] as List;
      } else if (decoded['movies'] is List) {
        list = decoded['movies'] as List;
      } else {
        list = [];
      }
    } else {
      list = [];
    }

    return list
        .whereType<Map>()
        .map((e) => MovieModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}