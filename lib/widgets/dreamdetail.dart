import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/loan.dart';
import 'moneyslider.dart';

class DetailPage extends StatelessWidget {
//Detalle de sueño/historia
  final Loan loan;

  DetailPage(this.loan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loan.titulo),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: CircleAvatar(
              radius: 50.0,
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
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  child: Text('Expira pronto'),
                  onPressed: (){},
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MoneySlider()));
                  },
                  child: Text('Ayudalo!'),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
