import 'package:flutter/material.dart';
import 'form.dart';
import 'pay_history.dart';
import 'terms_service.dart';
import 'borrower_profile.dart';

class MenuDrawerB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
                child: UserAccountsDrawerHeader(
                accountName: Text('Lenora Rodriguez'),
                accountEmail: Text('Lenora@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.people),
                ),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BorrowerScreen()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Solicita tu préstamo'),
              onTap: (){
                 Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormScreen()),
            );
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Realizar un pago'),
              onTap: (){
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PayHistory()),
            );
              },
            ), // ListTile
            ListTile(
              leading: Icon(Icons.priority_high),
              title: Text('Terminos y condiciones'),
              onTap: (){
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TermsService()),
            );
              },
            ),
          ],
        ),
      );
  }
}
