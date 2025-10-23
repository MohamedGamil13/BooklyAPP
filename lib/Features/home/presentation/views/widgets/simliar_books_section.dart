import 'package:bookly_app/Features/home/presentation/views/widgets/featured_films_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimliarBooksSection extends StatelessWidget {
  const SimliarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You Can also Like',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const FeaturedFilmsItem(
                    imageUrl:
                        'https://tse1.mm.bing.net/th/id/OIP.oqNwChrb_h42KYxCQ_TcDAHaLG?w=683&h=1024&rs=1&pid=ImgDetMain&o=7&rm=3',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
