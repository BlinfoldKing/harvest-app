import 'package:flutter/material.dart';
import 'package:harvest_app/screens/auth/main.dart';
import 'package:harvest_app/utils/theme.dart';
import 'home/main.dart';

enum RootState {
  AUTH,
  HOME,
}

class Root extends StatefulWidget {
  @override
  _Root createState() => _Root();
}

class _Root extends State<Root> {
  String _userToken = 'aa';
  RootState _rootState = RootState.HOME;

  void _setToken(String token) {
    setState(() {
      _userToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (this._userToken == '') {
      this._rootState = RootState.AUTH;

      content = Auth(this._setToken);
    }

    switch (this._rootState) {
      case RootState.HOME:
        content = Homepage(title: 'hello world');
        break;
      default:
        content = Auth(this._setToken);
    }

    return MaterialApp(
      title: 'Harvest',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: content,
      ),
    );
  }
}
