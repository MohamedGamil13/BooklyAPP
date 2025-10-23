import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BestSellerSliverlist extends StatelessWidget {
  const BestSellerSliverlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: GestureDetector(
            child: BestSellerListviewItem(),
            onTap: () {
              Get.to(
                BookDetailsView(),
                transition: Transition.downToUp,
                duration: kduration,
              );
            },
          ),
        ),
        childCount: 100,
      ),
    );
  }
}
