import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/toggleButton.dart';
import 'package:harvest_app/entity/user.dart';
import 'package:harvest_app/mock/user.mock.dart';
import 'package:harvest_app/screens/auth/main.dart';
import 'package:harvest_app/utils/theme.dart';
import 'package:nanoid/nanoid.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    UserEntity user = null;
    for (int i = 0; i < UserMock.list.length; i++) {
      if (UserMock.list[i].id == UserMock.currentLoggedInUser) {
        user = UserMock.list[i];
        break;
      }
    }

    return Container(
      color: Color(0xfff0f0f0),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
            color: Colors.white,
            child: Row(
              children: [
                CircleAvatar(
                  minRadius: 40,
                  maxRadius: 40,
                  backgroundColor: HarvestTheme.ligthViolet,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "id: " + user.id,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 18, top: 14, right: 14),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Akun',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 9),
                ),
                createProfileItem(
                  icon: Icon(OMIcons.person),
                  text: 'Ubah Akun',
                  onPress: () {},
                ),
                createProfileItem(
                  icon: Icon(OMIcons.lock),
                  text: 'Ubah Kode Keamanan',
                  onPress: () {},
                ),
                createProfileItem(
                  icon: Icon(OMIcons.book),
                  text: 'Syarat Dan Ketentuan',
                  onPress: () {},
                ),
                createProfileItem(
                  icon: Icon(OMIcons.help),
                  text: 'Pusat Bantuan',
                  onPress: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 23, horizontal: 19),
            width: double.infinity,
            child: HarvestToogleButton(
              child: Text('Log Out'),
              isActive: false,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Auth(
                      state: AuthNavState.LOGIN,
                    ),
                  ),
                  (route) => route.isCurrent,
                );
              },
              color: HarvestTheme.ligthViolet,
              inActiveColor: Colors.white,
              textColor: HarvestTheme.darkPurple,
              borderColor: HarvestTheme.darkPurple,
            ),
          )
        ],
      ),
    );
  }
}

Widget createProfileItem({Icon icon, String text, Function() onPress}) {
  return InkWell(
    onTap: onPress,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          icon,
          Padding(
            padding: EdgeInsets.only(right: 14),
          ),
          Text(text),
          Spacer(
            flex: 1,
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    ),
  );
}
