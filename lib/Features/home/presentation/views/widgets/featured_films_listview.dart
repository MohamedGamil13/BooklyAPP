import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:flutter/material.dart';

class FeaturedFilmsListview extends StatelessWidget {
  const FeaturedFilmsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,

      child: ListView.builder(
        itemBuilder: (context, index) => FeaturedFilmsItem(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
