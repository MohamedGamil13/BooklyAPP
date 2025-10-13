import 'package:bookly_app/Features/home/presentation/views/widgets/details_section_widget.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/simliar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: const DetailsSectionWidget()),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(children: const [SimliarBooksSection()]),
        ),
      ],
    );
  }
}
