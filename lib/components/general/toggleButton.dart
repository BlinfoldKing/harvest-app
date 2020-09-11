import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';

class HarvestToogleButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;

  Color color = HarvestTheme.ligthViolet;
  Color inActiveColor = Colors.white;
  Color textColor = HarvestTheme.darkPurple;
  Color borderColor = HarvestTheme.darkPurple;

  bool isActive = false;

  HarvestToogleButton({
    this.onPressed,
    this.child,
    this.isActive,
    this.color,
    this.borderColor,
    this.textColor,
    this.inActiveColor,
  });

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
                  color: this.borderColor,
                  style: BorderStyle.solid,
                  width: 1,
                ),
        ),
        onPressed: this.onPressed,
        child: this.child,
        color: this.isActive ? this.color : this.inActiveColor,
        textColor: this.textColor,
      ),
    );
  }
}
