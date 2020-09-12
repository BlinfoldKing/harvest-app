import 'package:harvest_app/entity/income.dart';

class IncomeMock {
  static List<Income> list = List<Income>();

  static totalIncome(String user) {
    int ret = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i].userid == user) {
        ret += list[i].amount != null ? list[i].amount : 0;
        print(list[i].amount);
      }
    }

    return ret;
  }

  static totalOutcome(String user) {
    int ret = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i].userid == user) {
        ret += list[i].outAmount != null ? list[i].outAmount : 0;
        print(list[i].outAmount);
      }
    }

    print(ret);

    return ret;
  }

  static totalCashback(String user) {
    int ret = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i].userid == user) {
        ret += list[i].cashback != null ? list[i].cashback : 0;
        if (list[i].outCashback != null && list[i].outCashback > 0) {
          ret -= list[i].outCashback;
        }
      }
    }

    return ret;
  }
}
