import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 0,
      children: [
        Image.asset(Assets.logo, width: 150, fit: BoxFit.fitWidth),
        const Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 28)),
      ],
    );
  }
}
