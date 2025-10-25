import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_sliverlist.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_listview.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(),
                const SizedBox(height: 20),
                FeaturedFilmsListview(),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Best Seller', style: Styles.textStyle24),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          // SliverFillRemaining(child: BestSellerListview()),
          BestSellerSliverlist(),
        ],
      ),
    );
  }
}
