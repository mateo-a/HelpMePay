import "package:flutter/material.dart";

class TermsService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        title: Text('Terminos y Condiciones'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(14),
              child: Text('Lorem ipsum dolor sit amet, '
                  'consectetur adipiscing elit, sed do '
                  'eiusmod tempor incididunt ut labore '
                  'et dolore magna aliqua. Ut enim ad '
                  'minim veniam, quis nostrud exercitation '
                  ' ullamco laboris nisi ut aliquip ex ea '
                  'commodo consequat. Duis aute irure '
                  'dolor in reprehenderit in voluptate '
                  'velit esse cillum dolore eu fugiat '
                  'nulla pariatur. Excepteur sint '
                  'occaecat cupidatat non proident, '
                  'sunt in culpa qui officia deserunt '
                  'mollit anim id est laborum.'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(14),
            child: Text('Al proceder aceptas nuestros '
                'terminos de servicio y nuestra política '
                'de privacidad'),
          ),
          Container(
            padding: EdgeInsets.all(14),
            child: RaisedButton(
              onPressed: () {},
              child: const Text('Lo entiendo y deseo continuar'),
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
