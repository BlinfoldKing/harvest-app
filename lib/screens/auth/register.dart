import 'package:flutter/material.dart';
import 'package:harvest_app/entity/user.dart';
import 'package:harvest_app/mock/user.mock.dart';
import 'package:harvest_app/screens/auth/pin.dart';
import 'package:harvest_app/screens/home/main.dart';
import 'package:harvest_app/utils/illustration.dart';
import 'package:harvest_app/components/input/textInput.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/utils/theme.dart';
import 'package:harvest_app/screens/auth/main.dart';
import 'package:nanoid/nanoid.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  String _username;
  String _email;
  String _password;
  String _repassword;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Illustration.logoLightBg,
              Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Text(
                        'Buat Akun Baru',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      HarvestTextInputForm(
                        label: 'Username',
                        prefixIcon: Icon(OMIcons.person),
                        onChanged: (username) {
                          setState(() {
                            this._username = username;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'username could not be empty';
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      HarvestTextInputForm(
                        label: 'Email',
                        prefixIcon: Icon(OMIcons.email),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {
                          setState(() {
                            this._email = email;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      HarvestTextInputForm(
                        label: 'Password',
                        prefixIcon: Icon(OMIcons.lock),
                        obscureText: true,
                        onChanged: (password) {
                          setState(() {
                            this._password = password;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      HarvestTextInputForm(
                        label: 'Konfirmasi Password',
                        prefixIcon: Icon(OMIcons.lock),
                        obscureText: true,
                        onChanged: (repassword) {
                          setState(() {
                            this._repassword = repassword;
                          });
                        },
                        validator: (repassword) {
                          if (this._password != repassword) {
                            return 'password is not match';
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      Container(
                        width: double.infinity,
                        child: HarvestButton(
                          color: HarvestTheme.purple,
                          child: Text('Daftar Akun'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Pin(
                                    title: 'Buat Kode Keamanan',
                                    onDone: (newPin) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Pin(
                                            title: 'Konfirmasi Kode Keamanan',
                                            onDone: (String validatePin) {
                                              if (newPin == validatePin) {
                                                var newUser = new UserEntity();
                                                newUser.id = nanoid(10);
                                                newUser.username =
                                                    this._username;
                                                newUser.password =
                                                    this._password;
                                                newUser.pin = newPin;

                                                UserMock.list.add(newUser);
                                                UserMock.currentLoggedInUser =
                                                    newUser.id;
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Homepage(),
                                                  ),
                                                  (route) => route.isCurrent,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sudah punya akun? '),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Auth(
                                            state: AuthNavState.LOGIN,
                                          )),
                                  (route) => route.isCurrent);
                            },
                            child: Text(
                              'Masuk ke Bitment',
                              style: TextStyle(
                                  color: HarvestTheme.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
