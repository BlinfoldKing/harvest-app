import 'package:flutter/material.dart';
import 'package:harvest_app/screens/home/dashboard.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../../components/general/swipeableScaffold.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SwipeableScaffold(
      items: [
        generateNavItem(icon: OMIcons.home, text: 'Beranda'),
        generateNavItem(icon: OMIcons.creditCard, text: 'Transaksi'),
        generateNavItem(icon: OMIcons.book, text: 'Edukasi'),
        generateNavItem(icon: OMIcons.person, text: 'Akunku'),
      ],
      pages: [
        Dashboard(),
        Text('0'),
        Text('0'),
        Text('0'),
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
