import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailsSectionWidget extends StatelessWidget {
  const DetailsSectionWidget({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width * 0.23;

    return Column(
      children: [
        const CustomBookDetailsAppbar(),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: width),
          child: FeaturedFilmsItem(
            imageUrl: book.volumeInfo.imageLinks.toString(),
          ),
        ),
        const SizedBox(height: 43),
        Text(book.volumeInfo.title, style: Styles.textStyle30),
        const SizedBox(height: 6),
        Text(
          book.volumeInfo.publisher.toString(),
          style: Styles.textStyle16.copyWith(color: Color(0xffb7b5bc)),
        ),
        const SizedBox(height: 16),
        // const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 37),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: BookActions(),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
