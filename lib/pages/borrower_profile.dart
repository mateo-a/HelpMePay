import 'package:flutter/material.dart';
import 'drawer_b.dart';
// import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';
//import 'models/user.dart';

class BorrowerScreen extends StatelessWidget {
  //final User user;

  // const BorrowerScreen({Key key, @required this.user})
  //     : assert(user != null),
  //       super(key: key);

  // final prefs = new PreferenciasUsuario(); // Preferencias de usuario

  @override
  Widget build(BuildContext context) {
    // prefs.ultimaPagina = 'borrower'; // Guardar ultima pagina visitada

    return Scaffold(
      drawer: MenuDrawerB(),
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Member Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            SizedBox(height: 25),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.blue[700], shape: BoxShape.circle),
              child: Icon(
                Icons.person,
                size: 96,
                color: Colors.white,
              ),
            ),
            Container(
              child: Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      "Lenora Martinez",
                      //user.name,
                      textScaleFactor: 2,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: RaisedButton(
                color: Colors.green[500],
                child: Text('Make a Payment',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
