import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomBookDetailsAppbar extends StatelessWidget {
  const CustomBookDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.to(
                HomeView(),
                transition: Transition.circularReveal,
                duration: kduration,
              );
            },
            icon: Icon(Icons.close),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
    );
  }
}
