import "package:flutter/material.dart";
import 'package:flutterapp/pages/drawer_b.dart';

//screen for empty state. befor asking for a loan.
class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuDrawerB(),
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('Solicita un prestamo'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://icons.iconarchive.com/icons/inipagi/business-economic/256/rocket-icon.png',
                  width: 150,
                  height: 150),
              SizedBox(height: 25),
              Center(
                child: Text(
                  'Estas a unos pasos de completar '
                  'tu sueño. Completa el formulario para '
                  'solicitar tu prestamo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: RaisedButton(
                  color: Colors.green[500],
                  onPressed: () {
                    Navigator.pushNamed(context, 'formScreen');
                    /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormScreen()),
                );*/
                  },
                  child: const Text('Añadir prestamo',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }
}
