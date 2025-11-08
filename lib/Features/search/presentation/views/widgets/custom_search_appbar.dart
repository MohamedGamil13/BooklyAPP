import 'package:bookly_app/Features/search/presentation/views_model/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchAppbar extends StatelessWidget {
  const CustomSearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onSubmitted: (input) {
            if (input.trim().isNotEmpty) {
              context.read<SearchCubit>().searchBooks(input.trim());
            }
          },
          style: Styles.textStyle20,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.005),
            hintText: 'Search For Books by category...',
            hintStyle: Styles.textStyle20,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              gapPadding: 0,
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
