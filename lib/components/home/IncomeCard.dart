import 'package:flutter/material.dart';
import 'package:harvest_app/utils/formatMoney.dart';
import 'package:harvest_app/utils/theme.dart';

class IncomeCard extends StatelessWidget {
  final bool isCashback;
  final int amount;
  final int cashback;
  final String title;

  IncomeCard({
    this.isCashback,
    this.title,
    this.amount,
    this.cashback,
  });

  @override
  build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 26, top: 16, bottom: 13),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0x33212E40)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              this.isCashback
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4f4f4f),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7, bottom: 3),
                          child: Text(
                            'Besar Transaksi',
                            style: TextStyle(
                              color: Color(0x99212E40),
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          "Rp " + formatMoney(this.amount),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w800),
                        ),
                      ],
                    )
                  : Text(
                      this.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4f4f4f),
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 2),
                    child: Text(
                      this.isCashback ? 'Cashback' : 'Besar Transaksi',
                      style: TextStyle(
                        color: Color(0x99212E40),
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Text(
                    "Rp " +
                        formatMoney(
                            this.isCashback ? this.cashback : this.amount),
                    style: TextStyle(
                      color: HarvestTheme.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
