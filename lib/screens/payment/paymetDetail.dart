import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/entity/income.dart';
import 'package:harvest_app/entity/user.dart';
import 'package:harvest_app/mock/income.mock.dart';
import 'package:harvest_app/mock/user.mock.dart';
import 'package:harvest_app/screens/auth/pin.dart';
import 'package:harvest_app/screens/home/main.dart';
import 'package:harvest_app/utils/illustration.dart';
import 'package:harvest_app/utils/theme.dart';

class PaymentDetail extends StatefulWidget {
  @override
  _PaymentDetail createState() => _PaymentDetail();
}

class _PaymentDetail extends State<PaymentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HarvestAppBarWithBack(title: 'Detail Product Reksadana'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 24, bottom: 18),
                  child: Column(
                    children: [
                      Container(
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
                        child: Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  color: HarvestTheme.light,
                                  child: Image.network(
                                    'https://1.bp.blogspot.com/-pnICdpaY8rg/VGeG5DgOWhI/AAAAAAAACD8/K7onW6dupLY/s1600/LOGO_BARU_PIZZA_HUT.png',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 14),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pizza Hut Buah Batu',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Jl. Buah Batu No.137, Turangga, Kec. Lengkong, Kota Bandung, Jawa Barat 40264',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            bottom: 14, left: 18, right: 18, top: 13),
                        margin: EdgeInsets.only(top: 14),
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
                              'Jenis Reksadana',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Double Box Jumbo x2',
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              'Manajer Investasi',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rp 220.000',
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              'Deskripsi Tambahan',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Extra Mayo',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            bottom: 14, left: 18, right: 18, top: 13),
                        margin: EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff212E40).withOpacity(0.42),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi Tambahan',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Cashback Rp 30.000',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              'Rp 200.000',
                              style: TextStyle(
                                  color: HarvestTheme.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                child: Text('Beli'),
                color: HarvestTheme.purple,
                onPressed: () {
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

                          var newTransaction = Income();
                          newTransaction.outAmount = 200000;
                          newTransaction.cashback = 30000;
                          newTransaction.title = 'Pizza Hut';
                          newTransaction.amount = 0;
                          newTransaction.userid = UserMock.currentLoggedInUser;

                          if (IncomeMock.totalIncome(
                                  UserMock.currentLoggedInUser) >=
                              200000) {
                            IncomeMock.list.add(newTransaction);
                            if (pin == user.pin) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Homepage();
                                  },
                                ),
                                (route) => route.isCurrent,
                              );
                            }
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
