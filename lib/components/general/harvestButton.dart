import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';

class HarvestButton extends StatelessWidget {
  Function() onPressed;
  Widget child;

  HarvestButton({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 31,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: this.onPressed,
        child: this.child,
        color: HarvestTheme.darkPurple,
        textColor: Colors.white,
      ),
    );
  }
}
