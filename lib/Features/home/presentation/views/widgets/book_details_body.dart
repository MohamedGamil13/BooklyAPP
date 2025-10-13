import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width * 0.23;
    return Column(
      children: [
        CustomBookDetailsAppbar(),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: width),
          child: FeaturedFilmsItem(),
        ),
        const SizedBox(height: 43),
        Text('The Jungle Book', style: Styles.textStyle30),
        const SizedBox(height: 6),
        Text(
          'Rudyard kipling',
          style: Styles.textStyle16.copyWith(color: Color(0xffb7b5bc)),
        ),
        Center(child: BookRating()),
      ],
    );
  }
}
