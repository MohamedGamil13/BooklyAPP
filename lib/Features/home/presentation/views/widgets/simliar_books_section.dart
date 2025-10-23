import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/Features/home/presentation/views_model/ralevant_bookCuvit/ralevant_book_cubit_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimliarBooksSection extends StatelessWidget {
  const SimliarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RalevantBookCubitCubit, RalevantBookCubitState>(
      builder: (context, state) {
        if (state is RalevantBookCubitSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You Can also Like',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView.builder(
                    itemCount: state.books.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FeaturedFilmsItem(
                          imageUrl:
                              state
                                  .books[index]
                                  .volumeInfo
                                  .imageLinks
                                  ?.thumbnail ??
                              'https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        } else if (state is RalevantBookCubitFailure) {
          return Text(state.errorMassege);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
