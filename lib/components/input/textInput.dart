import 'package:flutter/material.dart';

class HarvestTextInputForm extends StatelessWidget {
  final String label;

  bool obscureText = false;
  Function(String) validator = (value) {};
  Function(String) onChanged = (value) {};
  TextInputType keyboardType = TextInputType.text;
  Widget prefixIcon;

  HarvestTextInputForm({
    this.label,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.prefixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.obscureText != null ? this.obscureText : false,
      onChanged: this.onChanged,
      validator: this.validator,
      keyboardType: this.keyboardType,
      decoration: InputDecoration(
        prefixIcon: this.prefixIcon,
        hintText: this.label,
        contentPadding: EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 23,
        ),
        hintStyle: TextStyle(fontSize: 14),
        errorStyle: TextStyle(color: Color(0x00000000)),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffff0000), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffff0000), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffc7c7c7), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffc7c7c7), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
