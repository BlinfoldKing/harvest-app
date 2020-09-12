import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harvest_app/components/home/IncomeCard.dart';
import 'package:harvest_app/components/home/TransactionList.dart';
import 'package:harvest_app/components/general/toggleButton.dart';
import 'package:harvest_app/mock/income.mock.dart';
import 'package:harvest_app/mock/user.mock.dart';
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
  List<IncomeCard> ret = List<IncomeCard>();
  for (int i = 0; i < IncomeMock.list.length; i++) {
    if (IncomeMock.list[i].userid == UserMock.currentLoggedInUser) {
      var inc = IncomeMock.list[i];
      if (inc.amount != null && inc.amount > 0 ||
          inc.cashback != null && inc.cashback > 0) {
        ret.add(IncomeCard(
          title: inc.title != null ? inc.title : 'Unknown',
          amount: inc.amount != null && inc.amount > 0
              ? inc.amount
              : (inc.outAmount != null ? inc.outAmount : 0),
          cashback: inc.cashback != null ? inc.cashback : 0,
          isCashback: inc.cashback != null ? inc.cashback > 0 : false,
        ));
      }
    }
  }
  return ret.reversed.toList();
}

List<Widget> generateOutcome() {
  List<IncomeCard> ret = List<IncomeCard>();
  for (int i = 0; i < IncomeMock.list.length; i++) {
    if (IncomeMock.list[i].userid == UserMock.currentLoggedInUser) {
      var inc = IncomeMock.list[i];
      if (inc.outAmount != null && inc.outAmount > 0) {
        ret.add(IncomeCard(
          title: inc.title != null ? inc.title : 'Unknown',
          amount: inc.outAmount,
          isCashback: false,
        ));
      }

      if (inc.outCashback != null && inc.outCashback > 0) {
        ret.add(IncomeCard(
          title: inc.title != null ? inc.title : 'Unknown',
          amount: inc.outCashback,
          isCashback: false,
        ));
      }
    }
  }

  return ret.reversed.toList();
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
