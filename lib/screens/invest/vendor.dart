import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/screens/invest/checkout.dart';
import 'package:harvest_app/utils/illustration.dart';
import 'package:harvest_app/utils/theme.dart';

class Vendor extends StatelessWidget {
  final String vendorId;
  final String goalId;

  Vendor({this.vendorId, this.goalId});

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
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            bottom: 14, left: 18, right: 18, top: 13),
                        margin: EdgeInsets.only(top: 14),
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
                              'Jenis Reksadana',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff212E40).withOpacity(0.6),
                              ),
                            ),
                            Text(
                              'RD - Saham',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              'Manajer Investasi',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff212E40).withOpacity(0.6),
                              ),
                            ),
                            Text(
                              'Ashmore Asset Management Indonesia, PT',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              'Total Dana Kelola',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff212E40).withOpacity(0.6),
                              ),
                            ),
                            Text(
                              'Rp 100.000.000',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            bottom: 14, left: 18, right: 18, top: 13),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'NAB/Unit',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff212E40).withOpacity(0.6),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Rp 1,602.51',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' (2020-08-26)',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Periode Investasi',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff212E40).withOpacity(0.6),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '< 2 Tahun',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tingkat Resiko',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff212E40).withOpacity(0.6),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Rendah',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff31B057),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Performa Kinerja Masa Lalu',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff212E40).withOpacity(0.42),
                            width: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Illustration.demodata,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff212E40).withOpacity(0.42),
                            width: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Illustration.demograph,
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
                      builder: (context) => Checkout(
                        vendorId: this.vendorId,
                        goalId: this.goalId,
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
