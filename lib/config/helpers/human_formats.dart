import 'package:intl/intl.dart';

class HumanFormats {
  static String formatNumber(double number, [int decimals = 0]) {
    final formatterNumber = NumberFormat.compactCurrency(
            decimalDigits: decimals, symbol: '', locale: 'en_US')
        .format(number);

    return formatterNumber;
  }

  //Esto lo agregué yo, no hace parte del curso
  static String formatDate(DateTime date) {
    final formatterDate = DateFormat.yMMMMd('en_US').format(date);
    return formatterDate;
  }

  //NOTAS:

  /// Examples Using the US Locale:
///   Pattern                          Result
///   ----------------                 -------
      // new DateFormat.yMd()             -> 7/10/1996
      // new DateFormat('yMd')            -> 7/10/1996
      // new DateFormat.yMMMMd('en_US')   -> July 10, 1996 <- Este es el que usé arriba
      // new DateFormat.jm()              -> 5:08 PM
      // new DateFormat.yMd().add_jm()    -> 7/10/1996 5:08 PM
      // new DateFormat.Hm()              -> 17:08 // force 24 hour time
}
