import 'package:flutter/material.dart';
import 'package:harvest_app/components/home/BalanceCard.dart';
import 'package:harvest_app/components/home/GoalCard.dart';
import 'package:harvest_app/utils/illustration.dart';
import 'package:harvest_app/utils/theme.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_1.png'),
                fit: BoxFit.cover),
          ),
          child: Container(
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
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 24, left: 21, right: 21, bottom: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Goals Menabung',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5b5b5b)),
                  ),
                  Text(
                    'Tambah Goals',
                    style: TextStyle(color: HarvestTheme.violet),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                  GoalCard(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
