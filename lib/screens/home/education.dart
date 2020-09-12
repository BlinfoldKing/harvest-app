import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harvest_app/components/home/ArticleCard.dart';
import 'package:url_launcher/url_launcher.dart';

class Education extends StatefulWidget {
  @override
  _Education createState() => _Education();
}

class _Education extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17, horizontal: 18),
      child: Expanded(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            for (int i = 0; i < 10; i++)
              InkWell(
                onTap: () async {
                  var url =
                      'https://blog.halofina.id/nabung-biaya-nikah-dengan-investasi-reksadana/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print('error to launch');
                  }
                },
                child: ArticleCard(),
              ),
          ],
        ),
      ),
    );
  }
}
