import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';

class HarvestButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color color;
  final Color textColor;
  final Color borderColor;

  HarvestButton({
    this.onPressed,
    this.child,
    this.color,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 31,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: this.onPressed,
        child: this.child,
        color: this.color != null ? this.color : HarvestTheme.darkPurple,
        textColor: this.textColor != null ? this.textColor : Colors.white,
      ),
    );
  }
}
