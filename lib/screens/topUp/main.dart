import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/components/general/toggleButton.dart';
import 'package:harvest_app/utils/theme.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class TopUp extends StatefulWidget {
  @override
  _TopUp createState() => _TopUp();
}

class _TopUp extends State<TopUp> {
  int _amount = 0;

  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HarvestAppBarWithBack(title: 'Top Up Saldo'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Color(0xfff0f0f0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        bottom: 14, left: 18, right: 18, top: 13),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff212E40).withOpacity(0.42),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo Akun Saat ini',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff212E40).withOpacity(0.6),
                          ),
                        ),
                        Text(
                          'Rp 200.000',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: HarvestTheme.purple),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Nomial Top Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: HarvestToogleButton(
                              child: Text('100.000'),
                              onPressed: () {
                                txt.text = '100000';
                                setState(() {
                                  this._amount = 100000;
                                });
                              },
                              textColor: HarvestTheme.black,
                              inActiveColor: Color(0xfff0f0f0),
                              borderColor: Color(0xffd7d7d7),
                              isActive: false,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Expanded(
                            child: HarvestToogleButton(
                              child: Text('250.000'),
                              onPressed: () {
                                txt.text = '250000';
                                setState(() {
                                  this._amount = 250000;
                                });
                              },
                              textColor: HarvestTheme.black,
                              inActiveColor: Color(0xfff0f0f0),
                              borderColor: Color(0xffd7d7d7),
                              isActive: false,
                            ),
                          ), // Expanded(
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Expanded(
                            child: HarvestToogleButton(
                              child: Text('500.000'),
                              onPressed: () {
                                txt.text = '500000';
                                setState(() {
                                  this._amount = 500000;
                                });
                              },
                              textColor: HarvestTheme.black,
                              inActiveColor: Color(0xfff0f0f0),
                              borderColor: Color(0xffd7d7d7),
                              isActive: false,
                            ),
                          ), // Expanded(
                        ],
                      ),
                      Text(
                        'Masukan Jumlah Nominal Pembelian',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Rp',
                            style: TextStyle(fontSize: 18),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                this._amount = int.tryParse(value);
                              },
                              controller: txt,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // border: InputBorder.none,
                                hintText: 'Minimal 10.000',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Nomial Top Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: HarvestToogleButton(
                              isActive: false,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Icon(
                                      OMIcons.creditCard,
                                      color: HarvestTheme.purple,
                                    ),
                                    Text(
                                      'Kartu Debit A',
                                      style: TextStyle(
                                        color: HarvestTheme.purple,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onPressed: () {},
                              color: Colors.white,
                              borderColor: HarvestTheme.purple,
                              inActiveColor: Colors.white,
                            ),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            child: Container(
              width: double.infinity,
              child: HarvestButton(
                child: Text('Top Up Saldo'),
                color: HarvestTheme.purple,
                onPressed: () {
                  if (this._amount >= 10000)
                    Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
