import "package:flutter/material.dart";
import 'package:flutterapp/drawer_b.dart';
import 'form.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawerB(),
      appBar: AppBar(
        title: Text('Solicita un prestamo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Estas a unos pasos de completar '
                'tus sueño. Completa el formulario para '
                'solicitar tu prestamo', textAlign: TextAlign.center,),
          ),
          SizedBox(height: 50),
          Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormScreen()),
                );
              },
              child: const Text('Añadir prestamo'),
            ),
          ),
        ],
      ),
      )
      
    );
    throw UnimplementedError();
  }
}
