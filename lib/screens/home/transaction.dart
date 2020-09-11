import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harvest_app/components/home/IncomeCard.dart';
import 'package:harvest_app/components/home/TransactionList.dart';
import 'package:harvest_app/components/general/toggleButton.dart';
import 'package:harvest_app/utils/theme.dart';

class Transaction extends StatefulWidget {
  @override
  _Transaction createState() => _Transaction();
}

enum _TransactionState {
  INCOME,
  OUTCOME,
}

List<Widget> generateIncome() {
  return <Widget>[
    IncomeCard(
      amount: 100000,
      isCashback: true,
      title: 'Pizza Hut',
      cashback: 10000,
    ),
    IncomeCard(
      amount: 100000,
      title: 'Top Up',
      isCashback: false,
    ),
  ];
}

List<Widget> generateOutcome() {
  return <Widget>[
    IncomeCard(
      amount: 100000,
      title: 'Pizza Hut',
      isCashback: false,
    ),
  ];
}

class _Transaction extends State<Transaction> {
  _TransactionState _state = _TransactionState.INCOME;

  @override
  Widget build(BuildContext context) {
    var items = this._state == _TransactionState.INCOME
        ? generateIncome()
        : generateOutcome();

    return ListView(
      // padding: EdgeInsets.symmetric(horizontal: 14, vertical: 21),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 14),
                      child: HarvestToogleButton(
                        child: Text('Pemasukan'),
                        color: HarvestTheme.ligthViolet,
                        inActiveColor: Colors.white,
                        textColor: HarvestTheme.darkPurple,
                        borderColor: HarvestTheme.darkPurple,
                        onPressed: () {
                          setState(() {
                            this._state = _TransactionState.INCOME;
                          });
                        },
                        isActive: this._state == _TransactionState.INCOME,
                      ),
                    ),
                  ),
                  Expanded(
                    child: HarvestToogleButton(
                      color: HarvestTheme.ligthViolet,
                      inActiveColor: Colors.white,
                      textColor: HarvestTheme.darkPurple,
                      borderColor: HarvestTheme.darkPurple,
                      child: Text('Pengeluaran'),
                      onPressed: () {
                        setState(() {
                          this._state = _TransactionState.OUTCOME;
                        });
                      },
                      isActive: this._state == _TransactionState.OUTCOME,
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    for (int i = 0; i < 10; i++)
                      Container(
                        width: double.infinity,
                        child: TransactionList(
                          items: items,
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
