import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UserEarnings {
  final String day;
  final int money;
  final charts.Color barColor;

  UserEarnings(
      {@required this.day, @required this.money, @required this.barColor});
}

class UserChart extends StatelessWidget {
  final List<UserEarnings> data;

  UserChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<UserEarnings, String>> series = [
      charts.Series(
        id: "Ganancias",
        data: data,
        domainFn: (UserEarnings series, _) => series.day,
        measureFn: (UserEarnings series, _) => series.money,
        colorFn: (UserEarnings series, _) => series.barColor,
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: <Widget>[
            Text(
              "Tus ganancias",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Expanded(
              child: charts.BarChart(series, animate: true),
            )
          ],
        ),
      ),
    );
  }
}
