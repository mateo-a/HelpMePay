import "package:flutter/material.dart";

import 'package:flutterapp/models/worker_model.dart';
import 'package:flutterapp/models/investor_model.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/providers/investors_provider.dart';

import 'package:flutterapp/providers/usuario_provider.dart';
import 'package:flutterapp/providers/workers_provider.dart';
import 'package:flutterapp/utils/utils.dart';



class Registro extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();
  final workerProvider = new WorkersProvider();
  final investorProvider = new InvestorsProvider();

  final WorkerModel worker = new WorkerModel();
  final InvestorModel investor = new InvestorModel();


  @override
  Widget build(BuildContext context) {
    final workersBloc  = Provider.workersBloc(context);
    final investorBloc = Provider.investorBloc(context);
    
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context, workersBloc, investorBloc),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context, WorkersBloc workersBloc, InvestorBloc investorBloc ){
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 50.0,
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
                Text ('Crear Cuenta', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 30.0),
                _crearEmail( bloc ),
                SizedBox(height: 30.0),
                _crearPassword( bloc ),
                SizedBox(height: 30.0),
                _crearNombre( bloc ),
                SizedBox(height: 30.0),
                _crearApellido( bloc ),
                SizedBox(height: 30.0),
                _crearCedula( bloc ),
                SizedBox(height: 30.0),
                Text ('Registrate como:', style: TextStyle(fontSize: 15.0),),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  SizedBox(),
                  _crearBotonWorker( bloc, workersBloc ),
                  SizedBox(width: 20.0),
                  Text ('Ó', style: TextStyle(fontSize: 15.0)),
                  SizedBox(width: 20.0),
                  _crearBotonInvestor( bloc, investorBloc ),
                  SizedBox(),
                ],
                ),
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
        child: Text ( ' ¿Ya tienes cuenta?   Login ',
        style: TextStyle(
          color: Colors.blue[900],
          decoration: TextDecoration.underline)
          ),
        onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
      )
    );
  }

  _registerInvestor(BuildContext context, LoginBloc bloc, InvestorBloc investorBloc) async {
    final info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
    if ( info['ok'] ) {
      investor.id       = '${info['localId']}';
      investor.nombre   = '${bloc.nombre}';
      investor.apellido = '${bloc.apellido}';
      investor.cedula   = '${bloc.cedula}';
      // worker.imagen  = '${bloc.imagen}';
      final res = await investorProvider.crearInvestor(investor);
      if (res == true) {
        //investorBloc.agregarInvestor(investor);
        Navigator.pushReplacementNamed(context, 'dream');
        } else {
          return Center( child: CircularProgressIndicator());
        }
    } else {
      mostrarAlerta( context, info['message']);
    }
  }
  
  _registerWorker(BuildContext context, LoginBloc bloc, WorkersBloc workersBloc) async {
    final info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
    if ( info['ok'] ) {
      worker.id       = '${info['localId']}';
      worker.nombre   = '${bloc.nombre}';
      worker.apellido = '${bloc.apellido}';
      worker.cedula   = '${bloc.cedula}';
      // worker.imagen  = '${bloc.imagen}';
      final res = await  workerProvider.crearWorker(worker);
      if (res == true) {
        // workersBloc.agregarWorker(worker);
        Navigator.pushReplacementNamed(context, 'borrower');
        } else {
          return Center( child: CircularProgressIndicator());
        }
    } else {
      mostrarAlerta( context, info['message']);
    }
  }

    Widget _crearBotonInvestor( LoginBloc bloc, InvestorBloc investorBloc ){
    // formValidStream
    // snapshot.hasData
    // true ? algo si true : algo si false
    return StreamBuilder(
      stream: bloc.formValidStreamRegister ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 5.0, vertical: 15.0 ),
            child: Text('Inversionista'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.blue[900],
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _registerInvestor( context, bloc, investorBloc ) : null
        );
      },
    );
  }

  Widget _crearBotonWorker( LoginBloc bloc, WorkersBloc workersBloc ){
    // formValidStream
    // snapshot.hasData
    // true ? algo si true : algo si false
    return StreamBuilder(
      stream: bloc.formValidStreamRegister ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 15.0 ),
            child: Text('Trabajador'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.blue[900],
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _registerWorker( context, bloc, workersBloc ) : null
        );
      },
    );
  }

  Widget _crearCedula( LoginBloc bloc ) {

    return StreamBuilder(
      stream: bloc.cedulaStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container (
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon( Icons.call_to_action, color: Colors.blue[900] ),
              hintText: 'Ej. 80123678',
              labelText: 'Cedula',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changeCedula,
          ),
        );
      },
    );
  }
  
  Widget _crearApellido( LoginBloc bloc ) {

    return StreamBuilder(
      stream: bloc.apellidoStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container (
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              icon: Icon( Icons.perm_identity, color: Colors.blue[900] ),
              hintText: 'Ej. Roa',
              labelText: 'Apellido',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changeApellido,
          ),
        );
      },
    );
  }
  
  Widget _crearNombre( LoginBloc bloc ) {

    return StreamBuilder(
      stream: bloc.nombreStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container (
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              icon: Icon( Icons.perm_identity ,color: Colors.blue[900] ),
              hintText: 'Ej. Fernando',
              labelText: 'Nombre',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changeNombre,
          ),
        );
      },
    );
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
              child: Text('HelpMePay', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            )
            ],
          )
        )
      ],
    );
  }
}
