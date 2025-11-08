import 'package:bookly_app/Features/search/presentation/views/widgets/custom_gridview.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_appbar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomSearchAppbar(),
          Expanded(child: CustomGridview()),
        ],
      ),
    );
  }
}
