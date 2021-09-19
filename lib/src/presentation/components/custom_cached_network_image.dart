import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/icons/app_icons.dart';

class CustomCachedImageNetwork extends StatelessWidget {
  final double? height;
  final double? width;
  final String url;
  final Color color;
  final Color imageColor;
  final double placeHolderSize;
  final EdgeInsets padding;

  const CustomCachedImageNetwork({
    Key? key,
    this.height,
    this.width,
    this.url = '',
    this.color = Colors.transparent,
    this.imageColor = Colors.black,
    this.placeHolderSize = 16,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('================> url: $url');
    return Material(
      color: color,
      child: Ink(
        height: height,
        width: width,
        padding: padding,
        child: CachedNetworkImage(
          imageUrl: url,
          height: height,
          width: width,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, _) => Ink(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                Icons.image,
                color: imageColor,
                size: placeHolderSize,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Ink(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                Icons.image,
                color: imageColor,
                size: placeHolderSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
