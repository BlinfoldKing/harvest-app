import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';

class TransactionList extends StatelessWidget {
  final String title;
  final List<Widget> items;

  TransactionList({
    this.title,
    this.items,
  });

  var date = DateTime.now().day;
  var year = DateTime.now().year;

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(3),
          color: HarvestTheme.light,
          child: Text(
            '$date September $year',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (var item in items)
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: item,
          ),
      ],
    );
  }
}
