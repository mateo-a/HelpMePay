import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutterapp/widgets/earningschart.dart';
import 'package:flutterapp/models/Userearnings.dart';
import 'package:flutterapp/pages/drawer.dart';

class EarningScreen extends StatelessWidget {
    //a mocked list of user earnings that is to be replaced by information coming from the server
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
  
  //the constructor of the screen 
  @override
  Widget build(BuildContext context) {
    return /*MaterialApp(
      home:*/ DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Ganancias"),
                Tab(text: "En prestamo"),              ],
            ),
            title: Text('Tus ganancias'),
          ),
          body: TabBarView(
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    //the earnings dashboard
                    Center(
                      child: UserChart(data: data),
                    ),
                    // the history of payments
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
                  ],
                ),
                
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.blue,
                      height: 400,
                      margin: EdgeInsets.only(left: 2, right: 2 ),
                      child: Center (
                        child: Text(
                        "500000",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50, color: Colors.white), 
                      ),
                      )
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
                  ],
                )
              ),              
              
            ],
          ),
        ),
      );
  }
}
