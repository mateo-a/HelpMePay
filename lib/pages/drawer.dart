import 'package:flutter/material.dart';
//import 'earnings.dart';

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
              leading: Icon(Icons.add_box),
              title: Text('Agrega Fondos a tu Cuenta'),
              onTap: () {
                Navigator.pushNamed(context, 'funds');
               /* Navigator.push(context, 
                MaterialPageRoute(builder: (context) => MyDreamHomePage())); */
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Financia un sueño'),
              onTap: () {
                Navigator.pushNamed(context, 'dream');
               /* Navigator.push(context, 
                MaterialPageRoute(builder: (context) => MyDreamHomePage())); */
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Ganancias'),
              onTap: (){
                Navigator.pushNamed(context, 'earning');
                /* Navigator.push(context, 
                MaterialPageRoute(builder: (context) => EarningScreen())); */
              }
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Financiados'),
              onTap: (){
                Navigator.pushNamed(context, 'earningByBorrower');
               /* Navigator.push(context, 
                MaterialPageRoute(builder: (context) => EarningsByBorrower())); */
              }
            ),  // ListTile
            ListTile(
              leading: Icon(Icons.priority_high),
              title: Text('Terminos y condiciones'),
              onTap: () {
                Navigator.pushNamed(context, 'termService');
              /*  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => TermsService())); */
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, 'login');
              /*  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => TermsService())); */
              },
            ),
          ],
        ),
    );
  }
}