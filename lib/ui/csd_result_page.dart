import 'package:career_bss_interview_test/core/config/app_colors.dart';
import 'package:career_bss_interview_test/data/datasource/random_data_source.dart';
import 'package:career_bss_interview_test/ui/app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../domain/entity/user.dart';
import 'bottom_bar.dart';
import 'large_filled_button.dart';

final usersFuture = RemoteDataSource.mockUsers();

class CsdResultPage extends StatefulWidget {
  const CsdResultPage({Key? key}) : super(key: key);

  @override
  State<CsdResultPage> createState() => _CsdResultPageState();
}

class _CsdResultPageState extends State<CsdResultPage> {
  var userName = "John";
  var pos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomBar(),
      body: FutureBuilder<List<User>>(
        future: usersFuture,
        builder: (context, usersSnapshot) {
          final users = usersSnapshot.data ?? List.empty();
          return Stack(
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
                //CustomScrollView(
                //   slivers: [

                //   ],
                // )
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 32.0),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 17.0),
                                child: SvgPicture.asset(
                                    "assets/ic_back_button.svg"),
                              ),
                              const SizedBox(height: 8.0),
                              const AppSearchBar(),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 28.0),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 17.0),
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
                                  items: users
                                      .map(
                                          (user) => SliderImageItem(user: user))
                                      .toList(),
                                ),
                                const SizedBox(height: 20.0),
                                LargeFilledButton(userName: userName),
                                const SizedBox(height: 26.0),
                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
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
                        const SizedBox(width: 8),
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
