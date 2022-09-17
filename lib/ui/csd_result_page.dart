import 'package:career_bss_interview_test/core/config/app_colors.dart';
import 'package:career_bss_interview_test/data/datasource/random_data_source.dart';
import 'package:career_bss_interview_test/ui/wallet_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../domain/entity/user.dart';

final users = RemoteDataSource().mockUsers();

class CsdResultPage extends StatefulWidget {
  const CsdResultPage({Key? key}) : super(key: key);

  @override
  State<CsdResultPage> createState() => _CsdResultPageState();
}

class _CsdResultPageState extends State<CsdResultPage> {
  var userName = users[0].firstName;

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
                      onPageChanged: (position, reason) {
                        setState(() {
                          userName = users[position].firstName;
                        });
                      }),
                  items:
                      users.map((user) => SliderImageItem(user: user)).toList(),
                ),
                const SizedBox(height: 20.0),
                LargeFilledButton(userName: userName),
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
  final User user;

  const SliderImageItem({
    Key? key,
    required this.user,
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
                user.imageUrl,
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
                        Text(
                          "${user.firstName} ${user.lastName}",
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SvgPicture.asset("assets/ic_verified.svg")
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      user.about,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Work at: ${user.workplace}\n"
                      "Studied from: ${user.studiedAt}\n"
                      "From: ${user.location}",
                      style: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.white,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.fade,
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
        children: [
          const RoundedClippedIcon(asset: "assets/ic_bell.svg"),
          const SizedBox(width: 15.0),
          const Expanded(child: CsdSearchBox()),
          const SizedBox(width: 15.0),
          GestureDetector(
            child: const RoundedClippedIcon(asset: "assets/ic_wallet.svg"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WalletPage())),
          ),
        ],
      ),
    );
  }
}

class LargeFilledButton extends StatelessWidget {
  final String userName;

  const LargeFilledButton({
    Key? key,
    required this.userName,
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
            Text(
              "Follow $userName",
              style: const TextStyle(
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
