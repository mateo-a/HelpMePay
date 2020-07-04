import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutterapp/pages/drawer_b.dart';

class ProgressBorrower extends StatefulWidget {
  @override
  _ProgressBorrowerState createState() => _ProgressBorrowerState();
}

class _ProgressBorrowerState extends State<ProgressBorrower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawerB(),
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Recaudo de fondos"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            CircularPercentIndicator(
              header: Text(
                "\n45\nDías restantes",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              radius: 130.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.7,
              animateFromLastPercent: true,
              center: Text(
                "\u0024 476000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: Text(
                "Te faltan \u0024 24000 para completar tu meta",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.deepOrange,
            ),
            Container(
              height: 50,
              child: Card(
                color: Colors.blueGrey[50],
                child: const Center(
                  child: Text(
                    "Un inversor ha contribuido con \u0024 50000, Hurra!",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Card(
                color: Colors.blueGrey[50],
                child: const Center(
                  child: Text(
                    "Un inversor ha contribuido con \u0024 150000, Hurra!",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Card(
                color: Colors.blueGrey[50],
                child: const Center(
                  child: Text(
                    "Un inversor ha contribuido con \u0024 50000, Hurra!",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
