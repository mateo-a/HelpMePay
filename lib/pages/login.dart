import "package:flutter/material.dart";
// import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
//import 'package:flutterapp/pages/signup.dart';
//import 'package:flutterapp/pages/drawer_b.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        /*  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
            ],
          ),
          ), */
        ],
      ),
    );
    //throw UnimplementedError();
  }

  Widget _loginForm(BuildContext context){
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180.0,
            )
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:  BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: [
                Text ('HelpMePay', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 60.0),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _crearBoton(),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text('By proceeding you agree with the terms '
                    'of service and the privacy policy.'),
              ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearPassword() {
    return Container (
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon( Icons.lock_outline, color: Colors.blue[900] ),
          labelText: 'Contraseña',
        )
      ),
    );
  }

  Widget _crearBoton(){

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0 ),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Colors.blue[900],
      textColor: Colors.white,
      onPressed: (){},
    );
  }


  Widget _crearEmail() {
    return Container (
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon( Icons.alternate_email, color: Colors.blue[900] ),
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo electrónico',
        )
      ),
    );
  }


  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoAzul = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue[200], Colors.blue[900]]),
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      )
    );

    return Stack(
      children: [
        fondoAzul,
        Positioned(top: 70.0, left: -10.0, child: circulo),
        Positioned(top: 90.0, left: 40.0, child: circulo),
        Positioned(top: 150.0, right: -30.0, child: circulo),
        Positioned(top: 180.0, right: 0.0, child: circulo),
        Positioned(top: 210.0, left: 160, child: circulo),

        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(  
            children: [
              SizedBox( width: double.infinity ),
              Container(
              padding: EdgeInsets.all(14),
              child: Text('HelpMePay es una plataforma de '
                        'Crowdlending que te ayuda a alcanzar '
                        'tus sueños y/o ayudar a financiar los de '
                        'otros', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            )
            ],
          )
        )
      ],
    );
  }
}
