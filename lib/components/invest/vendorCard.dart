import 'package:flutter/cupertino.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/utils/theme.dart';

class VendorCard extends StatelessWidget {
  final String id;

  Function(String) onBuy = (id) {};

  VendorCard({this.id, this.onBuy});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 14, left: 18, right: 18, top: 13),
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
          Column(
            children: [
              Row(
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
              Padding(
                padding: EdgeInsets.only(bottom: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pembayaran Minimun',
                        style: TextStyle(
                            color: Color(0xff212E40).withOpacity(0.6),
                            fontSize: 8),
                      ),
                      Text(
                        'Rp 100.000',
                        style: TextStyle(
                          fontSize: 10,
                          color: HarvestTheme.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Performa Kinerja',
                        style: TextStyle(
                            color: Color(0xff212E40).withOpacity(0.6),
                            fontSize: 8),
                      ),
                      Text(
                        '5.74%',
                        style: TextStyle(
                          fontSize: 10,
                          color: HarvestTheme.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Dana Kelola',
                        style: TextStyle(
                            color: Color(0xff212E40).withOpacity(0.6),
                            fontSize: 8),
                      ),
                      Text(
                        'Rp 100.000.000',
                        style: TextStyle(
                          fontSize: 10,
                          color: HarvestTheme.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: HarvestButton(
                  onPressed: () {
                    this.onBuy(this.id);
                  },
                  child: Text(
                    'Beli',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
