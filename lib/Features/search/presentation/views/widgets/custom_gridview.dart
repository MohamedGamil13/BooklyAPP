import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/Features/search/presentation/views_model/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_progress_indector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(() => BookDetailsView(book: state.books[index]));
                },
                child: FeaturedFilmsItem(
                  imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ??
                      'https://tse1.mm.bing.net/th/id/OIP.9AxhSpKqIYF7imxoBkOOFgHaL2?cb=ucfimgc2&rs=1&pid=ImgDetMain&o=7&rm=3',
                ),
              ),
            ),
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(state.errMessage, style: Styles.textStyle24),
          );
        } else if (state is Searchloading) {
          return const Center(child: CustomProgressIndector());
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
