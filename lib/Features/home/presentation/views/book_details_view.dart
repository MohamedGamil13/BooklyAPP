import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_body.dart';
import 'package:bookly_app/Features/home/presentation/views_model/ralevant_bookCuvit/ralevant_book_cubit_cubit.dart';
import 'package:bookly_app/core/utils/sevices_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RalevantBookCubitCubit(getIt.get<HomeRepoImpl>())
        ..fetchRalevantBooks(
          category: book.volumeInfo.categories?[0] ?? "Programming",
        ),
      child: Scaffold(
        body: SafeArea(child: BookDetailsBody(book: book)),
      ),
    );
  }
}
