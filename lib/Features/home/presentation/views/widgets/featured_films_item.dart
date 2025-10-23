import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedFilmsItem extends StatelessWidget {
  const FeaturedFilmsItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) =>
              Center(child: CircularProgressIndicator()),
          fit: BoxFit.fill,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
