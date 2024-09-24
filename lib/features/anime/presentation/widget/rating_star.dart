import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({
    super.key,
    required this.fieldScore,
  });

  final double fieldScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/star_inactive.svg"),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            fieldScore == 0 ? "5" : fieldScore.toStringAsFixed(1),
          ),
        ),
      ],
    );
  }
}
