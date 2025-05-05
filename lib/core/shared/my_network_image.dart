import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/constants/app_assets.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeHolder, 
    this.borderRadius = BorderRadius.zero,
  });
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadiusGeometry borderRadius;
  final Widget? placeHolder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) =>
            placeHolder ??
            Image.asset(
              AppAssets.placeholder,
              height: height,
              width: width,
              fit: fit,
            ),
        errorWidget: (context, url, error) =>
        imageUrl == null && placeHolder != null
        ? _placeHolder!
        : Image.asset(
          AppAssets.placeholder,
          height: height,
          width: width,
          fit: fit,
        ),
      ),
    );
  }
  Widget? get _placeHolder{ 
    if(placeHolder == null) return null;
    return Align(
      child: SizedBox(
        width: width,
        height: height,
        child: placeHolder,
      ),
    );
  }
}
