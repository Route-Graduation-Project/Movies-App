class MovieModel {
  final int id;
  final String title;
  final double rating;
  final int year;
  final String imageUrl;

  MovieModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.year,
    required this.imageUrl,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      year: json['year'] ?? 0,
      imageUrl: json['large_cover_image'] ?? '',
    );
  }
}