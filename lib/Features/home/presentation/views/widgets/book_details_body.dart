import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
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
      ],
    );
  }
}
