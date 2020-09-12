import 'package:flutter/material.dart';
import 'package:harvest_app/screens/auth/register.dart';
import 'login.dart';

enum AuthNavState {
  LOGIN,
  REGISTER,
}
const LOGIN = 'login';
const REGISTER = 'register';

class Auth extends StatefulWidget {
  final AuthNavState state;
  final Function(String token) handleToken;

  Auth({this.handleToken, this.state});

  @override
  _Auth createState() => _Auth(state: this.state);
}

class _Auth extends State<Auth> {
  AuthNavState state = AuthNavState.LOGIN;

  _Auth({this.state});

  @override
  Widget build(BuildContext context) {
    if (this.state == AuthNavState.LOGIN) {
      return Scaffold(
        body: Login(),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Register(),
      ),
    );
  }
}
