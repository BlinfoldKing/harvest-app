import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';

class HarvestToogleButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  bool isActive = false;

  HarvestToogleButton({this.onPressed, this.child, this.isActive});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 31,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: this.isActive
              ? BorderSide.none
              : BorderSide(
                  color: HarvestTheme.ligthViolet,
                  style: BorderStyle.solid,
                  width: 1,
                ),
        ),
        onPressed: this.onPressed,
        child: this.child,
        color: this.isActive ? HarvestTheme.ligthViolet : Colors.white,
        textColor: HarvestTheme.darkPurple,
      ),
    );
  }
}
