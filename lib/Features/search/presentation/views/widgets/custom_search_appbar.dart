import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchAppbar extends StatelessWidget {
  const CustomSearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onSubmitted: (input) {},
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
