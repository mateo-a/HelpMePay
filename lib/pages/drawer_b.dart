import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/models/worker_model.dart';
import 'package:flutterapp/models/workernegocio_model.dart';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';

class MenuDrawerB extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  //Sidebar Menu for all inside views of the applications in the lender profile
  @override
  Widget build(BuildContext context) {
    final workerBloc = Provider.workersBloc(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            child: UserAccountsDrawerHeader(
              accountName: _creaNombre(workerBloc),
              accountEmail: Text(prefs.email),
              currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.people),
              ),
            ),
            onTap: (){
              // Navigator.pushReplacementNamed(context, 'borrower');
              Navigator.pushNamed(context, 'borrower');
            },
          ),
          _validaPrestamo(workerBloc),
          _estatusNegocio(workerBloc),
          ListTile(
            leading: Icon(Icons.priority_high),
            title: Text('Terminos y condiciones'),
            onTap: (){
              Navigator.pushNamed(context, 'termService');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }

  Widget _creaNombre(WorkersBloc workerBloc) {
    return StreamBuilder(
      stream: workerBloc.workersStream,
      builder: (BuildContext context, AsyncSnapshot<List<WorkerModel>> snapshot){
        if (snapshot.hasData) {
          final worker = snapshot.data;
          return Text(worker[0].nombre+' '+worker[0].apellido);
          } else {
            return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _validaPrestamo(WorkersBloc workersBloc) {
    workersBloc.cargarNegociosWorker(prefs.localid);
    return StreamBuilder(
      stream: workersBloc.workernegocioStream,
      builder: (BuildContext context, AsyncSnapshot<List<WorkerNegocios>> snapshot){   
      if (snapshot.hasData) {
        if (snapshot.data.length > 0) {
        prefs.negid = snapshot.data[0].id;
        return SizedBox();
      } else {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text('Solicita tu préstamo'),
            onTap: (){
              Navigator.pushNamed(context, 'emptyState');
          },
        );
      } 
      } else {
        return Center( child: CircularProgressIndicator());
      }
      },
    );
  }

  Widget _estatusNegocio(WorkersBloc workerBloc) {
    workerBloc.cargarNegociosWorker(prefs.localid);
    return StreamBuilder(
      stream: workerBloc.workernegocioStream,
      builder: (BuildContext context, AsyncSnapshot<List<WorkerNegocios>> snapshot){
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            if (snapshot.data[0].data.estado == "abierto") {
              print(snapshot.data[0].data.saldo);
              return ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Consultar Estado de Recaudo'),
                onTap: (){
                Navigator.pushNamed(context, 'progressBorrower');
                },
              );
            } else {
              return ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Realizar un pago'),
                onTap: (){
                Navigator.pushNamed(context, 'payHistory');
                },
              );
            }
          } else {
            return SizedBox();
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
