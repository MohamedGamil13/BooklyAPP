import 'package:bookly_app/Features/home/presentation/views/widgets/details_section_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverFillRemaining(child: DetailsSectionWidget())],
    );
  }
}
