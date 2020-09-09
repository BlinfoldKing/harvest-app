import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

AppBar HarvestAppBar({String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: HarvestTheme.purple, fontSize: 18),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(
          Icons.notifications,
          color: HarvestTheme.darkPurple,
        ),
      )
    ],
  );
}
