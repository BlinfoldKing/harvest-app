import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';

class TransactionList extends StatelessWidget {
  final String title;
  final List<Widget> items;

  TransactionList({
    this.title,
    this.items,
  });

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(3),
          color: HarvestTheme.light,
          child: Text(
            '23 agustus 2020',
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
