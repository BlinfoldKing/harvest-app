import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/components/general/toggleButton.dart';
import 'package:harvest_app/entity/goal.dart';
import 'package:harvest_app/entity/income.dart';
import 'package:harvest_app/entity/user.dart';
import 'package:harvest_app/mock/goal.mock.dart';
import 'package:harvest_app/mock/income.mock.dart';
import 'package:harvest_app/mock/user.mock.dart';
import 'package:harvest_app/screens/auth/pin.dart';
import 'package:harvest_app/screens/home/main.dart';
import 'package:harvest_app/utils/formatMoney.dart';
import 'package:harvest_app/utils/theme.dart';

class Checkout extends StatefulWidget {
  final String vendorId;
  final String goalId;

  Checkout({this.vendorId, this.goalId});

  @override
  _Checkout createState() =>
      _Checkout(vendorId: this.vendorId, goalId: this.goalId);
}

class _Checkout extends State<Checkout> {
  final String vendorId;
  final String goalId;

  _Checkout({this.vendorId, this.goalId});

  var txt = TextEditingController();

  int _amount;
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    int income = IncomeMock.totalCashback(UserMock.currentLoggedInUser);

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
                  width: 1,
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
                  width: 1,
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
                    'Rp ' + formatMoney(income),
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
                            builder: (context) => Pin(
                              title: 'Masukan Kode Keamanan',
                              onDone: (pin) {
                                UserEntity user = null;
                                for (int i = 0; i < UserMock.list.length; i++) {
                                  if (UserMock.list[i].id ==
                                      UserMock.currentLoggedInUser) {
                                    user = UserMock.list[i];
                                    break;
                                  }
                                }

                                Goal g = null;
                                for (int i = 0; i < GoalMock.list.length; i++) {
                                  if (GoalMock.list[i].id == this.goalId) {
                                    g = GoalMock.list[i];
                                    break;
                                  }
                                }

                                if (pin == user.pin) {
                                  if (this._amount <= income) {
                                    g.currValue += this._amount;
                                    var i = Income();
                                    i.userid = UserMock.currentLoggedInUser;
                                    i.outCashback = this._amount;
                                    i.title = 'Reksadana HBSC Indonesia';
                                    IncomeMock.list.add(i);
                                  }

                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Homepage(
                                          showPopUp: true,
                                        );
                                      },
                                    ),
                                    (route) => route.isCurrent,
                                  );
                                }
                              },
                            ),
                          ),
                        );
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
