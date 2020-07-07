import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/negociosabiertos_model.dart';
//import '../models/loan.dart';
//import 'moneyslider.dart';

class DetailPage extends StatelessWidget {
//Detalle de sueño/historia
  @override
  Widget build(BuildContext context) {
  final NegociosAbiertosModel loan = ModalRoute.of(context).settings.arguments;

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
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/52.jpg'),
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
                Navigator.pushNamed(context, 'sliderDream', arguments: loan);
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
