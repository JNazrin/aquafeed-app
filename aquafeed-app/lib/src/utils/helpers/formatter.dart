import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('yyyy-MM-dd').format(date);
  }
  static String formatTime(DateTime? time) {
    DateTime currentTime = DateTime.now();
    return DateFormat.Hms().format(currentTime);
  }
}