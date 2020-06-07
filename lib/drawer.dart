import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

class MenuDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Lenora Rodriguez'),
              accountEmail: Text('Lenora@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.people), 
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Financia un sueño'),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Añade Fondos'),
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Ganancias'),
            ), // ListTile
            ListTile(
              leading: Icon(Icons.priority_high),
              title: Text('Terminos y condiciones'),
            ),
          ],
        ),
    );
  }
}