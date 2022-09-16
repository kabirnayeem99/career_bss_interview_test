import 'package:career_bss_interview_test/core/config/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CsdResultPage extends StatelessWidget {
  const CsdResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: SvgPicture.asset(
                "assets/bg_random.svg",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: SvgPicture.asset("assets/ic_back_button.svg"),
                ),
                const SizedBox(height: 8.0),
                const AppBar(),
                const SizedBox(height: 28.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: const Text(
                    "Results for CSD",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                  ),
                  items: const [
                    SliderImageItem(),
                    SliderImageItem(),
                    SliderImageItem(),
                  ],
                ),
                const SizedBox(height: 20.0),
                const LargeFilledButton(),
                const SizedBox(height: 26.0),
                Expanded(child: Container()),
                const BottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliderImageItem extends StatelessWidget {
  const SliderImageItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                "https://i.pinimg.com/originals/cd/64/e6/cd64e64f9f2d5a896c1af9ee2953ce7f.jpg",
                height: 400.0,
                width: 375.0,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      transparent,
                      greenBangladesh,
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 117.0,
                margin: const EdgeInsets.only(
                  left: 17.0,
                  right: 17.0,
                  bottom: 37.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SvgPicture.asset("assets/ic_verified.svg")
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      "Problem solver | Expert in FMCG | CSD",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      "Work at: Bangladesh Programming Ltd\n"
                      "Studied from: Bangladesh University of Science\n"
                      "From: Dhaka, Bangladesh",
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Row(
        children: const [
          RoundedClippedIcon(asset: "assets/ic_bell.svg"),
          SizedBox(width: 15.0),
          Expanded(child: CsdSearchBox()),
          SizedBox(width: 15.0),
          RoundedClippedIcon(asset: "assets/ic_wallet.svg"),
        ],
      ),
    );
  }
}

class LargeFilledButton extends StatelessWidget {
  const LargeFilledButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.symmetric(horizontal: 17.0),
      decoration: BoxDecoration(
        color: redImperial,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/ic_person_pending.svg"),
            const SizedBox(width: 10.0),
            const Text(
              "Follow John",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
