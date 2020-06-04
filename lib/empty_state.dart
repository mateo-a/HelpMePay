import "package:flutter/material.dart";

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text('Estas a unos pasos de completar '
                'tus sueño. Completa el formulario para '
                'solicitar tu prestamo'),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {},
              child: const Text('Añadir prestamo'),
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
