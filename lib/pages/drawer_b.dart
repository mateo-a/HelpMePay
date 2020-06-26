import 'package:flutter/material.dart';
//import 'pay_history.dart';
//import 'terms_service.dart';
//import 'borrower_profile.dart';
//import 'empty_state.dart';


class MenuDrawerB extends StatelessWidget {
  //Sidebar Menu for all inside views of the applications in the lender profile
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
                Navigator.pushNamed(context, 'borrower');
               /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BorrowerScreen()),); */
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Solicita tu préstamo'),
              onTap: (){
                Navigator.pushNamed(context, 'emptyState');
                  /*  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmptyState())); */
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Realizar un pago'),
              onTap: (){
                Navigator.pushNamed(context, 'payHistory');
                /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PayHistory()),
            ); */
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Consultar Estado de Recaudo'),
              onTap: (){
                Navigator.pushNamed(context, 'progressBorrower');
                /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PayHistory()),
            ); */
              },
            ),
            ListTile(
              leading: Icon(Icons.priority_high),
              title: Text('Terminos y condiciones'),
              onTap: (){
                Navigator.pushNamed(context, 'termService');
              /*   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TermsService()),
            ); */
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, 'NewUser');
              /*  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => TermsService())); */
              },
            ),
          ],
        ),
      );
  }
}
