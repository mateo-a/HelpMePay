import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/drawer_b.dart';

class Invoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de Pago"),
      ),
      drawer: MenuDrawerB(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: EdgeInsets.all(40),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Estado: asdasd\nfecha de pago: asdasdasd'
                  '\ntotal a pagar: akjhsadad'
                  '\nid de cuota: asdasdasd'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: RaisedButton(
              color: Colors.green[500],
              onPressed: () {},
              child: Text("Confirmar pago"),
            ),
          )
        ],
      ),
    );
  }
}
