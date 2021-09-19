import 'dart:math';

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

  // List<String> words - Array of words.
  // Example: ['депутат', 'депутата', 'депутатов'], ['коментарий', 'коментария', 'комментариев']
  static String pluralize(int count, List<String> words) {
    const cases = [2, 0, 1, 1, 1, 2];
    final position =
    (count % 100 > 4 && count % 100 < 20) ? 2 : cases[min(count % 10, 5)];

    return words[position];
  }

  static String addZero(int number) {
    return number.toString().length == 1 ? "0$number" : number.toString();
  }

  static String formatDate(DateTime date,
      {bool onlyDate = false, bool onlyTime = false}) {
    final dateString = [
      AppHelpers.addZero(date.day),
      AppHelpers.addZero(date.month),
      date.year
    ].join(".");

    final timeString = [
      AppHelpers.addZero(date.hour),
      AppHelpers.addZero(date.minute)
    ].join(":");

    if (onlyDate) {
      return dateString;
    }

    if (onlyTime) {
      return timeString;
    }

    return "$dateString $timeString";
  }

  static String formatDateBack(DateTime? dateTime) {
    return dateTime != null ? DateFormat('yyyy-MM-dd').format(dateTime) : '';
  }

  static String formatTime(int minutes) {
    final _hours = minutes ~/ 60;
    final _minutes = ((minutes / 60) - _hours) * 60 ~/ 1;

    final hoursText = AppHelpers.pluralize(_hours, ["час", "часа", "часов"]);

    if (_hours > 0 && _minutes <= 0) {
      return "$hoursText";
    } else if (_hours <= 0 && _minutes > 0) {
      return "$_minutes минут";
    }

    return "$hoursText $_minutes минут";
  }

  static double roundUp(num number, int up) => (number * up).round() / up;

  static DateTime getDateByWeekNumber(int year, int week) =>
      DateTime.utc(year, 1, ((week - 1) * 7) + (0));

  static String capitalize(String text) =>
      "${text[0].toUpperCase()}${text.substring(1)}";

  static int parseFormattedInput(String text) {
    try {
      return int.parse(text.split(' ').join(''));
    } catch (e) {
      return int.tryParse(text.split(specialSpaceCharacter).join('')) ?? 0;
    }
  }
}
