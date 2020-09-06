import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/utils/formatMoney.dart';
import 'package:harvest_app/utils/theme.dart';

class BalanceCard extends StatelessWidget {
  int currBalance;
  int currPoint;
  int currInvest;

  Function() onPayPressed;
  Function() onTopUpPressed;

  BalanceCard(
      {this.currBalance,
      this.currInvest,
      this.currPoint,
      this.onPayPressed,
      this.onTopUpPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Saldo Akun'),
              HarvestButton(
                onPressed: () {},
                child: Text('Bayar'),
              )
            ],
          ),
          Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rp ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(formatMoney(this.currBalance),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
                ],
              ),
            ],
          ),
          Divider(
            color: Color(0xffe7e7e7),
            thickness: 1.8,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Point Investasi',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    formatMoney(currPoint),
                    style: TextStyle(color: HarvestTheme.violet),
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Investasi',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    formatMoney(currInvest),
                    style: TextStyle(color: HarvestTheme.violet),
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
