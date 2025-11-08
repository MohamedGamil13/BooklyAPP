import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/Features/search/presentation/views_model/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_progress_indector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) => FeaturedFilmsItem(
              imageUrl:
                  'https://tse4.mm.bing.net/th/id/OIP.rb6aTeGCgJp_H4hAi-DMCwHaL0?cb=ucfimgc2&rs=1&pid=ImgDetMain&o=7&rm=3',
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
