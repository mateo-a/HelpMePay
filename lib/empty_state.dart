import "package:flutter/material.dart";

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Solicita un prestamo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(14),
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
