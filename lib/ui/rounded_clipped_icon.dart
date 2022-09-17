import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/config/app_colors.dart';

class RoundedClippedIcon extends StatelessWidget {
  final String asset;

  const RoundedClippedIcon({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45.0),
        color: redImperial,
      ),
      child: SvgPicture.asset(asset),
    );
  }
}
