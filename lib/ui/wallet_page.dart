import 'package:career_bss_interview_test/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'csd_result_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

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
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: SvgPicture.asset("assets/ic_back_button.svg"),
                  ),
                ),
                const SizedBox(height: 8.0),
                const AppBar(),
                const SizedBox(height: 28.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: const Text(
                    "My Wallet",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Center(child: CreditCardItem()),
                const SizedBox(height: 16.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Row(
                    children: const [
                      ExpandedOutlinedActionButton(
                        asset: "assets/ic_fly.svg",
                        label: "Cash Out",
                      ),
                      SizedBox(width: 20.0),
                      ExpandedOutlinedActionButton(
                        asset: "assets/ic_flag.svg",
                        label: "Update Info",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 17.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Transactions",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      SvgPicture.asset("assets/ic_sort.svg"),
                    ],
                  ),
                ),
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

class ExpandedOutlinedActionButton extends StatelessWidget {
  final String asset;
  final String label;

  const ExpandedOutlinedActionButton({
    Key? key,
    required this.asset,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: redImperial),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(asset),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: const TextStyle(
                color: redImperial,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreditCardItem extends StatelessWidget {
  const CreditCardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: 340.0,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/bg_credit_card.svg",
                height: 210,
                width: 340.0,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 19.0, vertical: 30.0),
                height: 150.0,
                width: 301.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/logo_upodesta.svg"),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Balance",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "UC 1000",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                "0128 *** **** 8956",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              SvgPicture.asset("assets/ic_eye_cut.svg"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "12/23",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
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
