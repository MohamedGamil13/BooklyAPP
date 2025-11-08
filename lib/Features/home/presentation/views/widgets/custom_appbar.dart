import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 0,
      children: [
        Image.asset(Assets.logo, width: 150, fit: BoxFit.fitWidth),
        const Spacer(),
        IconButton(
          onPressed: () {
            Get.to(
              () => const SearchView(),
              transition: Transition.size,
              duration: kduration,
            );
          },
          icon: Icon(Icons.search, size: 28),
        ),
      ],
    );
  }
}
