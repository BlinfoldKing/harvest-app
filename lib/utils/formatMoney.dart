String formatMoney(int money) {
  String res = '';
  while (money > 9) {
    int rem = money % 1000;

    if (rem == 0) {
      res = '000.' + res;
    } else {
      res = '$rem.' + res;
    }

    money ~/= 1000;
  }

  if (money > 0) {
    res = '$money.' + res;
  }

  res = res.substring(0, res.length - 1);

  return res;
}
