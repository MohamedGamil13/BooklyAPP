import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:flutter/cupertino.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
