import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/loan.dart';
//import '../models/loan.dart';
//import 'moneyslider.dart';

class DetailPage extends StatelessWidget {
//Detalle de sueño/historia
  @override
  Widget build(BuildContext context) {
    final Loan loan = ModalRoute.of(context).settings.arguments;

    //DetailPage(this.loan);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text(loan.titulo),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: CircleAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(loan.worker),
            ),
          ),
          Container(
            child: Wrap(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      loan.descripcion,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.blue,
            ),
          ),
          Container(
            child: RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, 'sliderDream');
              },
              child: Text('Expira pronto. Ayudalo!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )),
            ),
          )
        ],
      )),
    );
  }
}
