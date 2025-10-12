import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:flutter/material.dart';

class BestSellerSliverlist extends StatelessWidget {
  const BestSellerSliverlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: BestSellerListviewItem(),
        ),
        childCount: 100,
      ),
    );
  }
}
