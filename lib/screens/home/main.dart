import 'package:flutter/material.dart';
import 'package:harvest_app/screens/home/dashboard.dart';
import 'package:harvest_app/screens/home/transaction.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../../components/general/swipeableScaffold.dart';

class Homepage extends StatefulWidget {
  bool showPopUp = false;

  Homepage({Key key, this.title, this.showPopUp}) : super(key: key);
  final String title;

  @override
  _Homepage createState() => _Homepage(showPopUp: this.showPopUp);
}

class _Homepage extends State<Homepage> {
  bool _showNavbar = false;

  bool showPopUp;

  _Homepage({this.showPopUp});

  @override
  Widget build(BuildContext context) {
    return SwipeableScaffold(
      onTransition: (page, update) {
        if (page == 0) {
          update(enableAppBar: false);
        } else {
          update(enableAppBar: true);
        }
      },
      enableAppBar: this._showNavbar,
      items: [
        generateNavItem(icon: OMIcons.home, text: 'Beranda'),
        generateNavItem(icon: OMIcons.creditCard, text: 'Transaksi'),
        generateNavItem(icon: OMIcons.book, text: 'Edukasi'),
        generateNavItem(icon: OMIcons.person, text: 'Akunku'),
      ],
      titles: ['Beranda', 'Transaksi', 'Edukasi', 'Akunku'],
      pages: [
        Dashboard(
          showPopUp: this.showPopUp != null ? this.showPopUp : false,
        ),
        Transaction(),
        Text('not implemented'),
        Text('not implemented'),
      ],
    );
  }
}

BottomNavigationBarItem generateNavItem({icon: Icons, text: String}) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
    ),
    title: Text(
      text,
    ),
  );
}
