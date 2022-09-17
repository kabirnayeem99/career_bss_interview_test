import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'rounded_clipped_icon.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 80.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 60.0,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 67.0),
              child: SvgPicture.asset("assets/ic_menu.svg"),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: RoundedClippedIcon(asset: "assets/ic_home.svg"),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 67.0),
              child: SvgPicture.asset("assets/ic_calendar.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
