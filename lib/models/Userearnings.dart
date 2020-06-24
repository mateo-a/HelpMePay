import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UserEarnings {
  final String day;
  final int money;
  final charts.Color barColor;

  UserEarnings(
      {@required this.day, @required this.money, @required this.barColor});
}
