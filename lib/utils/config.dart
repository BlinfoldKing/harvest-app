import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  String appTitle;
  String apiURL;

  Config() {
    this.appTitle = DotEnv().env['APP_TITLE'];
    this.apiURL = DotEnv().env['API_URL'];
  }
}
