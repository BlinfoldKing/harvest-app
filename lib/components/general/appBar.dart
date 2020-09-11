import 'package:flutter/material.dart';
import 'package:harvest_app/utils/theme.dart';

AppBar HarvestAppBar({String title, Function() onPressed}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: HarvestTheme.purple, fontSize: 18),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.notifications,
          color: HarvestTheme.darkPurple,
        ),
      )
    ],
  );
}

AppBar HarvestAppBarWithBack({String title}) {
  return AppBar(
    iconTheme: IconThemeData(color: HarvestTheme.black),
    title: Text(
      title,
      style: TextStyle(color: HarvestTheme.black, fontSize: 18),
    ),
    backgroundColor: Colors.white,
    elevation: 1,
    actions: [],
  );
}

AppBar HarvestValidationAppBarWithBack({String title}) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    backgroundColor: HarvestTheme.violet,
    elevation: 1,
    actions: [],
  );
}
