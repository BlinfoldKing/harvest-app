import 'package:flutter/material.dart';
import 'package:harvest_app/screens/goals/main.dart';
import 'package:harvest_app/components/home/BalanceCard.dart';
import 'package:harvest_app/components/home/GoalCard.dart';
import 'package:harvest_app/screens/invest/main.dart';
import 'package:harvest_app/screens/topUp/main.dart';
import 'package:harvest_app/utils/illustration.dart';
import 'package:harvest_app/utils/theme.dart';

class Dashboard extends StatefulWidget {
  bool showPopUp = false;

  Dashboard({this.showPopUp});

  @override
  _Dashboard createState() => _Dashboard(showPopUp: this.showPopUp);
}

class _Dashboard extends State<Dashboard> {
  bool showPopUp = false;

  _Dashboard({this.showPopUp});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_1.png'),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 7),
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
                      onTopUpPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopUp(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 21, right: 21, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Goals Menabung',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5b5b5b)),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Goals()));
                        },
                        child: Text(
                          'Tambah Goals',
                          style: TextStyle(color: HarvestTheme.violet),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GoalCard(
                        id: 'some-id-1',
                        onDeposit: (id) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Invest(
                                  goalId: id,
                                ),
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        this.showPopUp
            ? Container(
                color: Color(0x88000000),
                child: AlertDialog(
                  content: new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Illustration.finance,
                      Text(
                        'Anda Telah Berinvestasi sebesar Rp.100.000 di PT Bank HSBC Indonesia',
                        textAlign: TextAlign.center,
                      ),
                      FlatButton(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              color: HarvestTheme.violet,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            this.showPopUp = false;
                          });
                        },
                      )
                    ],
                  ),
                ),
              )
            : Text('')
      ],
    );
  }
}
