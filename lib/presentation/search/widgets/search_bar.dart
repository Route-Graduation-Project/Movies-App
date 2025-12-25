import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: AppColors.gray),
          prefixIcon: const Icon(Icons.search, color: AppColors.white),
          filled: true,
          fillColor: const Color(0xFF2A2A2A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
