import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/Features/home/presentation/views_model/featured_bookCubit/featured_books_cubit.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_progress_indector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class FeaturedFilmsListview extends StatelessWidget {
  const FeaturedFilmsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSucess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent * 0.7) {
                  BlocProvider.of<FeaturedBooksCubit>(
                    context,
                  ).fetchFeaturedBooks();
                }
                return true;
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        BookDetailsView(book: state.books[index]),
                        transition: Transition.circularReveal,
                        duration: kduration,
                      );
                    },
                    child: FeaturedFilmsItem(
                      imageUrl:
                          state
                              .books[index]
                              .volumeInfo
                              .imageLinks
                              ?.smallThumbnail ??
                          '',
                    ),
                  ),
                ),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: Text(" ${state.errorMassege}", style: Styles.textStyle24),
          );
        } else {
          return CustomProgressIndector();
        }
      },
    );
  }
}
