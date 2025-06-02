import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String toFormattedString({String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(this);
  }

  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  bool isWeekend() {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }
}
