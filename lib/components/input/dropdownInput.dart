import 'package:flutter/material.dart';

class HarvestDropdownInputForm extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;

  HarvestDropdownInputForm({this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged: this.onChanged,
      value: items[0].value,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 23,
        ),
        hintStyle: TextStyle(fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffc7c7c7), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffc7c7c7), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      items: items,
    );
  }
}
