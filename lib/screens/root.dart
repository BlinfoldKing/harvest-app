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
  String _userToken = '';
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

      content = Auth(
        state: AuthNavState.LOGIN,
        handleToken: this._setToken,
      );
    }

    switch (this._rootState) {
      case RootState.HOME:
        content = Homepage();
        break;
      default:
        content = Auth(
          state: AuthNavState.LOGIN,
          handleToken: this._setToken,
        );
    }

    return MaterialApp(
      title: 'Harvest',
      theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: HarvestTheme.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'NotoSans',
          textTheme: TextTheme(
            bodyText1: TextStyle(color: HarvestTheme.black),
            bodyText2: TextStyle(color: HarvestTheme.black),
          ).apply(
            bodyColor: HarvestTheme.black,
          )),
      home: SafeArea(
        child: content,
      ),
    );
  }
}
