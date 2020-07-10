import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/models/worker_model.dart';
import 'package:flutterapp/models/workernegocio_model.dart';
//import 'package:flutterapp/models/workernegocio_model.dart';
import 'drawer_b.dart';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';
//import 'models/user.dart';

class BorrowerScreen extends StatelessWidget {
  //final User user;

  // const BorrowerScreen({Key key, @required this.user})
  //     : assert(user != null),
  //       super(key: key);

  final prefs = new PreferenciasUsuario(); // Preferencias de usuario

  @override
  Widget build(BuildContext context) {
    print(prefs.localid);
    // prefs.ultimaPagina = 'borrower'; // Guardar ultima pagina visitada
    final workerBloc = Provider.workersBloc(context);
    workerBloc.cargarWorker(prefs.localid);
    
    return Scaffold(
      drawer: MenuDrawerB(),
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Member Profile"),
      ),
      body: StreamBuilder(
        stream: workerBloc.workersStream,
        builder: (BuildContext context, AsyncSnapshot<List<WorkerModel>> snapshot) {
          if (snapshot.hasData) {
            final worker = snapshot.data;            
            return Padding(
              padding: EdgeInsets.all(8),
              child: ListView(
                children: [
                  SizedBox(height: 25),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue[700], shape: BoxShape.circle),
                    child: Icon(
                      Icons.person,
                      size: 96,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    child: Material(
                      type: MaterialType.transparency,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(worker[0].nombre,
                            //user.name,
                            textScaleFactor: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  _validaPrestamo(workerBloc),
                ],
              ),
            );
          } else {
            return Center( child: CircularProgressIndicator());
          }
        }  
      ),
    );
  }
  
  Widget _validaPrestamo(WorkersBloc workersBloc) {
    workersBloc.cargarNegociosWorker(prefs.localid);
    return StreamBuilder(
      stream: workersBloc.workernegocioStream,
      builder: (BuildContext context, AsyncSnapshot<List<WorkerNegocios>> snapshot){   
      if (snapshot.hasData) {
        if (snapshot.data.length > 0) {
          if (snapshot.data[0].data.estado == "abierto") {
            return Center(
              child: RaisedButton(
              color: Colors.green[500],
              child: Text('Consultar Estado de Recaudo',
              style: TextStyle(color: Colors.white, fontSize: 20)),
              onPressed: () {
                Navigator.pushNamed(context, 'payHistory');
              },
              ),
            );
          } else {
            prefs.negid = snapshot.data[0].id;
            return Center(
              child: RaisedButton(
                color: Colors.green[500],
                child: Text('Realiza un Pago',
                style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () {
                  Navigator.pushNamed(context, 'payHistory');
                  },
                ),
              );
            }
        } else {
          return Center(
            child: RaisedButton(
            color: Colors.green[500],
            child: Text('Solicita tu préstamo',
            style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              Navigator.pushNamed(context, 'emptyState');
              },
            ),
          );
        } 
      } else {
        return Center( child: CircularProgressIndicator());
      }
      },
    );
  }
}
