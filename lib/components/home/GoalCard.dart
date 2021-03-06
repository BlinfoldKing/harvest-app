import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/utils/formatMoney.dart';
import 'package:harvest_app/utils/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalCard extends StatelessWidget {
  Function(String) onDeposit = (id) {};

  final String id;
  final String title;
  final int curr;
  final int target;
  final int timeVal;
  final String timeUnit;

  GoalCard(
      {this.id,
      this.onDeposit,
      this.title,
      this.curr,
      this.target,
      this.timeUnit,
      this.timeVal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 26, right: 13, bottom: 12),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0x33212E40)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Spacer(
                flex: 1,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              this.title != null ? this.title : 'Unknown',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            '$timeVal $timeUnit dari sekarang',
            style: TextStyle(color: Color(0xa3212e40), fontSize: 10),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: LinearPercentIndicator(
              // width: 140.0,
              lineHeight: 5.0,
              padding: EdgeInsets.symmetric(horizontal: 0),
              percent: this.curr / this.target,
              backgroundColor: HarvestTheme.lightbg,
              progressColor: HarvestTheme.success,
            ),
          ),
          Text(
            'Rp. ' + formatMoney(this.curr) + '/' + formatMoney(this.target),
            style: TextStyle(color: Color(0xa3212e40), fontSize: 10),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monthly Recommendation',
                      style: TextStyle(color: HarvestTheme.grey, fontSize: 8),
                    ),
                    Text(
                      'Rp 300.676/Month',
                      style: TextStyle(
                          color: HarvestTheme.darkPurple, fontSize: 12),
                    )
                  ],
                ),
                HarvestButton(
                  child: Text('Deposit'),
                  onPressed: () {
                    this.onDeposit(this.id);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
