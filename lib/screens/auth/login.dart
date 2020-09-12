import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/components/input/textInput.dart';
import 'package:harvest_app/entity/user.dart';
import 'package:harvest_app/mock/user.mock.dart';
import 'package:harvest_app/screens/auth/main.dart';
import 'package:harvest_app/screens/home/main.dart';
import 'package:harvest_app/utils/illustration.dart';
import 'package:harvest_app/utils/theme.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 21),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_2.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Illustration.logoDarkBg,
                Illustration.analytics,
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
            child: Form(
              child: Column(
                children: [
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                        color: HarvestTheme.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  HarvestTextInputForm(
                    label: 'Username',
                    prefixIcon: Icon(OMIcons.person),
                    onChanged: (username) {
                      setState(() {
                        this.username = username;
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
                    onChanged: (pass) {
                      setState(() {
                        this.password = pass;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Container(
                    width: double.infinity,
                    child: HarvestButton(
                      color: HarvestTheme.purple,
                      child: Text('Masuk'),
                      onPressed: () {
                        print(UserMock.list[0].username);
                        print(UserMock.list[0].password);

                        UserEntity user = null;
                        for (int i = 0; i < UserMock.list.length; i++) {
                          if (UserMock.list[i].username.trim() ==
                              this.username.trim()) {
                            user = UserMock.list[i];
                            print('masuk');
                            break;
                          }
                        }

                        if (user != null &&
                            user.password.trim() == this.password.trim()) {
                          UserMock.currentLoggedInUser = user.id;

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homepage(),
                            ),
                            (route) => route.isCurrent,
                          );
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum punya akun? '),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Auth(
                                        state: AuthNavState.REGISTER,
                                      )),
                              (route) => route.isCurrent);
                        },
                        child: Text(
                          'Buat akun',
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
    );
  }
}
