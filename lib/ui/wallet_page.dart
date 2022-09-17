import 'package:career_bss_interview_test/core/config/app_colors.dart';
import 'package:career_bss_interview_test/data/datasource/random_data_source.dart';
import 'package:career_bss_interview_test/domain/entity/creditcard.dart';
import 'package:career_bss_interview_test/domain/entity/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_bar.dart';
import 'bottom_bar.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);

  // final transactions = RemoteDataSource.mockTransactions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomBar(),
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
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
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
                  const AppSearchBar(),
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
                  FutureBuilder<CreditCard>(
                    builder: (context, cardSnapshot) {
                      final card = cardSnapshot.data;
                      return card != null
                          ? Center(
                              child: CreditCardItem(card: card),
                            )
                          : const CircularProgressIndicator();
                    },
                    future: RemoteDataSource.mockCreditCard(),
                  ),
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 0.0),
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
                  FutureBuilder<List<Transaction>>(
                    future: RemoteDataSource.mockTransactions(),
                    builder: (context, snapshot) {
                      final transactions = snapshot.data;
                      return transactions != null
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, position) =>
                                  TransactionListItem(
                                      transaction: transactions[position]),
                              itemCount: transactions.length,
                            )
                          : const CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 26.0, right: 26.0, bottom: 15.0),
      height: 80.0,
      child: Stack(
        children: [
          SvgPicture.asset("assets/bg_transaction.svg"),
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                SvgPicture.asset("assets/ic_small_cut.svg"),
                const SizedBox(width: 20.0),
                const RoundedCashItem(),
                const SizedBox(width: 17.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160.0,
                      child: Text(
                        "Cash out via ${transaction.organisation}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      "At ${transaction.time} - ${transaction.date}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 17.0),
                Text(
                  "-${transaction.amount} BDT",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedCashItem extends StatelessWidget {
  const RoundedCashItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 17.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: SvgPicture.asset(
        "assets/ic_cash.svg",
        height: 15.0,
        width: 25.0,
        fit: BoxFit.contain,
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
    required this.card,
  }) : super(key: key);

  final CreditCard card;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: SizedBox(
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
                        children: [
                          const Text(
                            "Balance",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "UC ${card.balance}",
                            style: const TextStyle(
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
                          Text(
                            card.holderName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                card.creditCardInt,
                                style: const TextStyle(
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
                        children: [
                          Text(
                            card.expiryDate,
                            style: const TextStyle(
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
