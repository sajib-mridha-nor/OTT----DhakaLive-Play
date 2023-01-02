import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakalive/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';

class CustomCacheImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onClick;

  CustomCacheImage({Key? key, this.onClick, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        // height: 250,
        height: MediaQuery.of(context).size.height,
        placeholder: (context, url) => ShimmerImage(),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[300],
          child: const Icon(Icons.error),
        ),
      ),
    );
  }
}
