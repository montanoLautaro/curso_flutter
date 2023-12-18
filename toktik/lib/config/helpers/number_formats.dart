import 'package:intl/intl.dart';

class ReadbleNumberFormats {
  static String humanReadleNumber(double number) {
    //* formateador de la dependencia intl
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: "",
    ).format(number);

    return formatterNumber;
  }
}
