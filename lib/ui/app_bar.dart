import 'package:flutter/material.dart';

import 'csd_search_box.dart';
import 'rounded_clipped_icon.dart';
import 'wallet_page.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
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
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => WalletPage())),
          ),
        ],
      ),
    );
  }
}
