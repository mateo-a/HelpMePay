import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/rendering.dart';

class EarningScreen extends StatelessWidget {
  final List<UserEarnings> data = [
    UserEarnings(
      day: "02-02-21",
      money: 50000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    UserEarnings(
      day: "02-03-21",
      money: 10000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    UserEarnings(
      day: "02-04-21",
      money: 90000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    UserEarnings(
      day: "02-05-21",
      money: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    UserEarnings(
      day: "02-06-21",
      money: 75000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tus ganancias"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[

              Center(
                child: UserChart(data: data),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Nuevo Pago'),
                subtitle: Text('Borrower realizo un pago, Recibes 10% del total mas 5% de intereses'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Nuevo Pago'),
                subtitle: Text('Borrower realizo un pago, Recibes 10% del total mas 5% de intereses'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Nuevo Pago'),
                subtitle: Text('Borrower realizo un pago, Recibes 10% del total mas 5% de intereses'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Nuevo Pago'),
                subtitle: Text('Borrower realizo un pago, Recibes 10% del total mas 5% de intereses'),
              ),
            ]
          )
        ),
    );
  }
}

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
