import 'package:flutter/material.dart';

class CustomProgressIndector extends StatelessWidget {
  const CustomProgressIndector({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xffa29bfe)),
    );
  }
}
