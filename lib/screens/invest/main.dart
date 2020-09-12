import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/components/invest/vendorCard.dart';
import 'package:harvest_app/screens/invest/vendor.dart';

class Invest extends StatelessWidget {
  final String goalId;

  Invest({this.goalId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HarvestAppBarWithBack(
        title: 'Investasi Reksadana',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 27, horizontal: 18),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            VendorCard(
              id: 'some id',
              onBuy: (id) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Vendor(
                      vendorId: id,
                      goalId: this.goalId,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
