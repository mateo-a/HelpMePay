import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/providers/usuario_provider.dart';
import 'package:flutterapp/utils/utils.dart';
// import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';


class Login extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
    //throw UnimplementedError();
  }

  Widget _loginForm(BuildContext context){
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 120.0,
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
                Text ('Ingresar', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 30.0),
                _crearEmail( bloc ),
                SizedBox(height: 30.0),
                _crearPassword( bloc ),
                SizedBox(height: 30.0),
                _crearBoton( bloc ),
                SizedBox(height: 20.0),
                _nuevoUser(context),          
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

  Widget _nuevoUser(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: FlatButton(
        child: Text ( 'Crear una nueva cuenta ',
        style: TextStyle(
          color: Colors.blue[900],
          decoration: TextDecoration.underline)
          ),
        onPressed: ()=> Navigator.pushReplacementNamed(context, 'registro'),
      )
    );
  }

  Widget _crearBoton( LoginBloc bloc ){

    // formValidStream
    // snapshot.hasData
    // true ? algo si true : algo si false



    return StreamBuilder(
      stream: bloc.formValidStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
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
          onPressed: snapshot.hasData ? ()=> _login( context, bloc ) : null
        );
      },
    );
  }
  
  _login(BuildContext context, LoginBloc bloc) async {
    Map info = await usuarioProvider.login(bloc.email, bloc.password);
    if ( info['ok'] ) {
      // print('${bloc.email}');   Imprimir el email que está en el bloque usuario
      print('${bloc.email}');
      print('${info['localId']}');
      final id = ('${info['localId']}');
      final res = await Firestore.instance.collection("workers").document(id).get().then((value){
      return value.exists;
      }); 
      if (res != true ) {
        Navigator.pushReplacementNamed(context, 'dream');
      } else {
        Navigator.pushReplacementNamed(context, 'borrower');
      }

    } else {
      mostrarAlerta( context, info['message']);
    }
  }

  Widget _crearPassword( LoginBloc bloc ) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container (
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.blue[900] ),
              labelText: 'Contraseña',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearEmail( LoginBloc bloc ) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
      
      return Container (
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon( Icons.alternate_email, color: Colors.blue[900] ),
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo electrónico',
          //counterText: snapshot.data,
          errorText: snapshot.error
        ),
        onChanged: bloc.changeEmail,
      ),
      );
      },
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
          padding: EdgeInsets.only(top: 50.0),
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
