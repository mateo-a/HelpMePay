import "package:flutter/material.dart";

class TermsService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text('Lorem ipsum dolor sit amet, '
                'consectetur adipiscing elit, sed do '
                'eiusmod tempor incididunt ut labore '
                'et dolore magna aliqua. Ut enim ad '
                'minim veniam, quis nostrud exercitation'
                ' ullamco laboris nisi ut aliquip ex ea'
                'commodo consequat. Duis aute irure'
                'dolor in reprehenderit in voluptate'
                'velit esse cillum dolore eu fugiat'
                'nulla pariatur. Excepteur sint'
                'occaecat cupidatat non proident, '
                'sunt in culpa qui officia deserunt '
                'mollit anim id est laborum.'),
          ),
          Container (
            child: Text('Al proceder aceptas nuestros '
                'terminos de servicio y nuestra política '
                'de privacidad'),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {},
              child: const Text('Acepto condiciones'),
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}