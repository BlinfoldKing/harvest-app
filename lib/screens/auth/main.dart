import 'package:flutter/material.dart';
import 'login.dart';

enum AuthNavState {
  LOGIN,
  REGISTER,
}
const LOGIN = 'login';
const REGISTER = 'register';

class Auth extends StatefulWidget {
  final Function(String token) handleToken;

  Auth(this.handleToken);

  @override
  _Auth createState() => _Auth();
}

class _Auth extends State<Auth> {
  AuthNavState _pageState = AuthNavState.LOGIN;

  void _toLogin() {
    setState(() {
      this._pageState = AuthNavState.LOGIN;
    });
  }

  void _toRegister() {
    setState(() {
      this._pageState = AuthNavState.REGISTER;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._pageState == AuthNavState.LOGIN) {
      return Scaffold(
        body: Text('hello word'),
      );
    }
  }
}
