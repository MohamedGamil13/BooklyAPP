import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/Features/home/presentation/views_model/featured_bookCubit/featured_books_cubit.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_progress_indector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';

class FeaturedFilmsListview extends StatelessWidget {
  const FeaturedFilmsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          final cubit = BlocProvider.of<FeaturedBooksCubit>(context);

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification &&
                    notification.metrics.pixels >=
                        notification.metrics.maxScrollExtent * 0.8) {
                  if (!cubit.isLoadingMore) {
                    cubit.fetchFeaturedBooks();
                  }
                }
                return false; // مهم: ما توقفش الإشعارات
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount:
                    state.books.length +
                    (cubit.isLoadingMore ? 1 : 0), // loader آخر الليست
                itemBuilder: (context, index) {
                  if (index >= state.books.length) {
                    // مؤشر تحميل بسيط في نهاية القائمة
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final book = state.books[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          BookDetailsView(book: book),
                          transition: Transition.circularReveal,
                          duration: kduration,
                        );
                      },
                      child: FeaturedFilmsItem(
                        imageUrl:
                            book.volumeInfo.imageLinks?.smallThumbnail ?? '',
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: Text(state.errorMessage, style: Styles.textStyle24),
          );
        } else {
          return const CustomProgressIndector();
        }
      },
    );
  }
}
