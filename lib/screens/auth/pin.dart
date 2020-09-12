import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/utils/theme.dart';
import 'package:pinput/pin_put/pin_put.dart';

class Pin extends StatefulWidget {
  final Function(String) onDone;
  final String message;
  final String title;

  Pin({this.onDone, this.message, this.title});

  @override
  _Pin createState() =>
      _Pin(onDone: this.onDone, message: this.message, title: this.title);
}

class _Pin extends State<Pin> {
  final Function(String) onDone;
  final String message;

  String title = 'Masukan Kode Keamanan';

  _Pin({this.onDone, this.message, this.title});

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border(bottom: BorderSide(color: HarvestTheme.purple)),
      // borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HarvestValidationAppBarWithBack(
        title: 'Kode Keamanan',
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 42, vertical: 100),
        child: Column(
          children: [
            Text(
              this.title,
              style: TextStyle(
                color: HarvestTheme.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            PinPut(
              textStyle: TextStyle(
                color: HarvestTheme.purple,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                // if (value.length == 6) {
                //   this.onDone(value);
                // }
              },
              obscureText: '●',
              fieldsCount: 6,
              onSubmit: (pin) => onDone(pin),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: _pinPutDecoration,
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
