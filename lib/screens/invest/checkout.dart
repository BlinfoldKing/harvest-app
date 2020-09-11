import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/components/general/toggleButton.dart';
import 'package:harvest_app/screens/home/main.dart';
import 'package:harvest_app/utils/theme.dart';

class Checkout extends StatefulWidget {
  final String vendorId;

  Checkout({this.vendorId});

  @override
  _Checkout createState() => _Checkout(vendorId: this.vendorId);
}

class _Checkout extends State<Checkout> {
  final String vendorId;

  _Checkout({this.vendorId});

  var txt = TextEditingController();

  int _amount;
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HarvestValidationAppBarWithBack(
        title: 'Beli Produk',
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(bottom: 14, left: 18, right: 18, top: 13),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff212E40).withOpacity(0.42),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 54,
                    height: 54,
                    child: Container(
                      color: HarvestTheme.light,
                      child: Image.network(
                        'http://logok.org/wp-content/uploads/2014/06/HSBC_logo-880x660.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 14),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PT Bank HBSC Indonesia',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ASHMORE DANA EKUITAS NUSANTARA',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff212E40).withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              padding:
                  EdgeInsets.only(bottom: 14, left: 18, right: 18, top: 13),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff212E40).withOpacity(0.42),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Point Investasi Anda',
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
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            hintText: '10.000',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: HarvestToogleButton(
                        child: Text('10.000'),
                        onPressed: () {
                          txt.text = '10000';
                          setState(() {
                            this._amount = 10000;
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
                        child: Text('50.000'),
                        onPressed: () {
                          txt.text = '50000';
                          setState(() {
                            this._amount = 50000;
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
                Row(
                  children: [
                    Expanded(
                      child: HarvestToogleButton(
                        child: Text('100.000'),
                        onPressed: () {
                          txt.text = '100000';
                          setState(() {
                            this._amount = 10000;
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
                )
              ],
            ),
            Spacer(flex: 1),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      child: Checkbox(
                          value: this._agree,
                          onChanged: (value) {
                            setState(() {
                              this._agree = value;
                            });
                          }),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saya telah membaca dan menyetujui isi dari',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'Saya telah membaca dan menyetujui isi dari',
                          style: TextStyle(
                              fontSize: 10,
                              color: HarvestTheme.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: HarvestButton(
                    onPressed: () {
                      if (this._amount > 0 && this._agree) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homepage(
                                showPopUp: true,
                              ),
                            ));
                      }
                    },
                    color: HarvestTheme.purple,
                    child: Text('Beli'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
