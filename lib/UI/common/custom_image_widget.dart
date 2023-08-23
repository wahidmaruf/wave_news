import 'package:flutter/material.dart';
import 'package:wavenews/UI/common/shimmer/shimmer_image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit boxFit;
  final bool showFromCache;

  const CustomImageWidget({
    Key? key,
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.boxFit = BoxFit.fitHeight,
    this.showFromCache = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultImage = Image.asset(
      "assets/images/placeholder.png",
      fit: BoxFit.fitHeight,
      width: width,
      height: height,
    );

    if (showFromCache) {
      precacheImage(CachedNetworkImageProvider(imageUrl), context);
    }

    return Image(
      image: showFromCache
          ? CachedNetworkImageProvider(imageUrl)
          : CachedNetworkImageProvider(imageUrl, cacheKey: imageUrl),
      width: width,
      height: height,
      fit: boxFit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return ShimmerImageWidget(
            width: width,
            height: height,
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return defaultImage;
      },
    );
  }
}
