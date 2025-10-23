import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:bookly_app/Features/home/presentation/views_model/new_booksCubit/new_books_cubit.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/widgets/custom_progress_indector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BestSellerSliverlist extends StatelessWidget {
  const BestSellerSliverlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBooksCubit, NewBooksState>(
      builder: (context, state) {
        if (state is NewBooksSucess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: GestureDetector(
                  child: BestSellerListviewItem(book: state.books[index]),
                  onTap: () {
                    Get.to(
                      BookDetailsView(book: state.books[index]),
                      transition: Transition.circularReveal,
                      duration: kduration,
                    );
                  },
                ),
              ),
              childCount: state.books.length,
            ),
          );
        } else if (state is NewBooksFailure) {
          return SliverToBoxAdapter(child: Text("failure"));
        } else {
          return SliverToBoxAdapter(child: CustomProgressIndector());
        }
      },
    );
  }
}
