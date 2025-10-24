import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/Features/home/presentation/views_model/ralevant_bookCuvit/ralevant_book_cubit_cubit.dart';
import 'package:bookly_app/core/widgets/custom_progress_indector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimliarBookListview extends StatelessWidget {
  const SimliarBookListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RalevantBookCubitCubit, RalevantBookCubitState>(
      builder: (context, state) {
        if (state is RalevantBookCubitSuccess) {
          return SizedBox(
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
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        'https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg',
                  ),
                ),
              ),
            ),
          );
        } else if (state is RalevantBookCubitFailure) {
          return Text(state.errorMassege);
        } else {
          return Center(child: CustomProgressIndector());
        }
      },
    );
  }
}
