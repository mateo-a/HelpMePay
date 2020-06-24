import 'package:flutter/material.dart';
import 'earnings.dart';
import 'terms_service.dart';
import 'earnings_by_borrower.dart';
import 'dream.dart';

// Sidebar menu for all the views of the lender menu
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
                MaterialPageRoute(builder: (context) => MyDreamHomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Ganancias'),
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => EarningScreen()));
              }
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Financiados'),
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => EarningsByBorrower()));
              }
            ),  // ListTile
            ListTile(
              leading: Icon(Icons.priority_high),
              title: Text('Terminos y condiciones'),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => TermsService()));
              },
            ),
          ],
        ),
    );
  }
}