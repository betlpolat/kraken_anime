import 'package:flutter/material.dart';
import 'package:kraken_anime/core/utils/extension/context_extension.dart';

class CustomNetworkImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const CustomNetworkImage({super.key, required this.path, this.height, this.width, this.fit});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.normalBorderRadius,
      child: Image.network(
        path,
        filterQuality: FilterQuality.high,
        fit: fit,
        height: height,
        width: width,
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
