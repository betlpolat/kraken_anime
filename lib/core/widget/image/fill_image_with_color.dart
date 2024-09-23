import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FillImageWithColor extends StatelessWidget {
  final String imageUrl;
  final Color fillColor;
  final int percentage;

  const FillImageWithColor({
    required this.imageUrl,
    required this.fillColor,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final fillGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        fillColor,
        fillColor.withOpacity(0),
      ],
      stops: [
        percentage / 100,
        percentage / 100,
      ],
    );

    return Stack(
      children: [
        SvgPicture.asset(
          imageUrl,
        ),
        ShaderMask(
          shaderCallback: (bounds) => fillGradient.createShader(bounds),
          blendMode: BlendMode.srcATop,
          child: SvgPicture.asset(
            imageUrl,
          ),
        ),
      ],
    );
  }
}
