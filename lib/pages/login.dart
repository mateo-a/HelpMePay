import "package:flutter/material.dart";
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
//import 'package:flutterapp/pages/signup.dart';
//import 'package:flutterapp/pages/drawer_b.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              //colors: [Colors.deepOrange[300], Colors.red[300]]),
              colors: [Colors.blue[200], Colors.blue[900]]),
       ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
              padding: EdgeInsets.all(14),
                child: Text('Help me pay es una plataforma de '
                    'Crowdlending que te ayuda a alcanzar '
                    'tus sueños y/o ayudar a financiar los de '
                    'otros', style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold)),
            ),
          Container(
              padding: EdgeInsets.all(14),
              child: GoogleSignInButton(
            onPressed: () {
              Navigator.pushNamed(context, 'NewUser');
              },
          )),
          
          Container(
            padding: EdgeInsets.all(14),
            child: FacebookSignInButton(onPressed: () {
              Navigator.pushNamed(context, 'NewUser');
              // call authentication logic
            }),
          ),
          Container(
            padding: EdgeInsets.all(14),
            child: Text('By proceeding you agree with the terms '
                'of service and the privacy policy'),
          ),
        ],
      ),
      ),
    );
    throw UnimplementedError();
  }
}
