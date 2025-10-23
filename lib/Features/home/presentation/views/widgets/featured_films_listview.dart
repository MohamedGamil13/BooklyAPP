import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/Features/home/presentation/views_model/featured_bookCubit/featured_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_progress_indector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedFilmsListview extends StatelessWidget {
  const FeaturedFilmsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSucess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FeaturedFilmsItem(
                  imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail,
                ),
              ),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Text('error');
        } else {
          return CustomProgressIndector();
        }
      },
    );
  }
}
