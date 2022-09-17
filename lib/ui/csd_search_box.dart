import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/config/app_colors.dart';

class CsdSearchBox extends StatelessWidget {
  const CsdSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(color: redImperial),
      ),
      child: TextField(
        cursorColor: redImperial,
        style: const TextStyle(fontSize: 12.0, color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search with keyword",
          hintStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
          icon: SvgPicture.asset(
            "assets/ic_search.svg",
            color: redImperial,
          ),
        ),
      ),
    );
  }
}
