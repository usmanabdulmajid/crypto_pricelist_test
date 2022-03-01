import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double screenHeight([double percent = 1]) => _height * percent;
  double screenWidth([double percent = 1]) => _width * percent;
  double get _height => MediaQuery.of(this).size.height;
  double get _width => MediaQuery.of(this).size.width;
}

enum Month { jan, feb, mar, apr, may, jun, jul, aug, sept, oct, nov, dec }

extension DateExtension on DateTime {
  String toTimeMonthDayYear() {
    return '$hour:$minute, ${Month.values[month - 1].name.toUpperCase()} $day, $year';
  }
}
