import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/components/home/BalanceCard.dart';
import 'package:harvest_app/utils/illustration.dart';
import 'package:harvest_app/utils/theme.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Illustration.background_1,
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 7),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Illustration.logoDarkBg,
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ],
              ),
              BalanceCard(
                currBalance: 1230000,
                currInvest: 3000000,
                currPoint: 3000000,
                onPayPressed: () {},
                onTopUpPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
