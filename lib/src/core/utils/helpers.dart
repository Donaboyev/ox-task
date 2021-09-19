import 'package:intl/intl.dart';

class AppHelpers {
  // this char is not the same as general space symbol: " "
  static const specialSpaceCharacter = " ";

  static String formatNumber(num number,
      {bool short = false, int roundUpTo = 1, bool useSpecChar = false}) {
    String splitter = useSpecChar ? specialSpaceCharacter : " ";
    final isNegative = number.isNegative;
    number = number.abs();

    String result = "0";

    if (!short) {
      result = NumberFormat().format(number).split(",").join(splitter);
    } else {
      if (number < 1e3) {
        result = number.toString();
      }

      double formatted;

      if (number >= 1e3 && number < 1e6) {
        formatted = double.parse((number / 1e3).toStringAsFixed(roundUpTo));

        result = '${formatted % 1 == 0 ? formatted.round() : formatted}K';
      }

      if (number >= 1e6 && number < 1e9) {
        formatted = double.parse((number / 1e6).toStringAsFixed(roundUpTo));

        result = '${formatted % 1 == 0 ? formatted.round() : formatted}M';
      }

      if (number >= 1e9 && number < 1e12) {
        formatted = double.parse((number / 1e9).toStringAsFixed(roundUpTo));

        result = '${formatted % 1 == 0 ? formatted.round() : formatted}B';
      }
    }

    return isNegative ? "-" + result : result;
  }
}
