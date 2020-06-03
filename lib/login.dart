import "package:flutter/material.dart";
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text('Help me pay es una plataforma de '
                'Crowdlending que te ayuda alcanzar '
                'tus sueños y/o ayudar a financiar los de '
                'otros'),
          ),
          Container(
              child: GoogleSignInButton(
                onPressed: () {/* ... */},
              )
          ),
          Container (
            child: FacebookSignInButton(onPressed: () {
              // call authentication logic
            }),
          ),
          Container (
            child: Text('By proceeding you agree with the terms'
                'of service and the privacy policy'
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}