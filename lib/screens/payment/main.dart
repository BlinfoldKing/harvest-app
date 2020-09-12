import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/screens/payment/paymetDetail.dart';
import 'package:harvest_app/utils/theme.dart';

class Payment extends StatefulWidget {
  @override
  _Payment createState() => _Payment();
}

class _Payment extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 46),
                  ),
                  Container(
                    child: Text(
                      'Input Kode Pembayaran Manual',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Masukan nomor kode pembayaran pada barcode',
                    style: TextStyle(fontSize: 12),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    'Nomor Kode Pembayaran',
                    style: TextStyle(fontSize: 10),
                  ),
                  TextField(
                    onChanged: (value) {},
                  ),
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
                  child: Text('Buat Transaksi'),
                  color: HarvestTheme.purple,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentDetail(),
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
