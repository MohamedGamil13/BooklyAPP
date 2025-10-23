import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:flutter/material.dart';

class FeaturedFilmsListview extends StatelessWidget {
  const FeaturedFilmsListview({super.key});

  @override
  Widget build(BuildContext context) {
    print('==================================${books}');
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,

      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: FeaturedFilmsItem(),
        ),
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
