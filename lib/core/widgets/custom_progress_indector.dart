import 'package:bookly_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomProgressIndector extends StatelessWidget {
  const CustomProgressIndector({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator(color: kPrimaryColor));
  }
}
