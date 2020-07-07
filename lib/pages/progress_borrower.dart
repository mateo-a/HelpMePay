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
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\n🤝\n25\nPatrocinadores",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 23.0),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\n📅\n45\nDías restantes",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 23.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.all(20),
                child: LinearPercentIndicator(
                  lineHeight: 24.0,
                  width: 320.0,
                  animation: true,
                  trailing: new Text(" 🤑", style: TextStyle(fontSize: 32)),
                  percent: 0.7,
                  animateFromLastPercent: true,
                  center: Text(
                    "\u0024476000",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  progressColor: Colors.green[500],
                  backgroundColor: Colors.greenAccent[100],
                ),
              ),
              Center(
                child: Text("Meta: \u0024500000"),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                child: Card(
                  color: Colors.blueGrey[50],
                  child: const Center(
                    child: Text(
                      "Un  inversor ha contribuido con \u0024 50000, Hurra!",
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
        ));
  }
}
