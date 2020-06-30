import 'package:flutter/material.dart';
import 'package:flutterapp/models/investor_model.dart';
import 'package:flutterapp/models/worker_model.dart';
import 'package:flutterapp/providers/investors_provider.dart';
import 'package:flutterapp/providers/workers_provider.dart';

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final formKey = GlobalKey<FormState>(); //usar para validar campos del form
  final workerProvider = new WorkersProvider();
  final investorProvider = new InvestorsProvider(); // Proveedor para post HTTP

  WorkerModel worker = new WorkerModel();
  InvestorModel investor = new InvestorModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight, end: Alignment.bottomLeft,
                //colors: [Colors.deepOrange[300], Colors.red[300]]),
                colors: [Colors.blue[200], Colors.blue[900]]),
          ),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _textNew(),
                    ],
                  ),
                  _newName(),
                  _newSurname(),
                  _newDocId(),
                  _newImage(),
                  // NewEmail(),
                  // PasswordInput(),
                  _newInvestor(),
                  _newWorker(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _newInvestor() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          onPressed: () {
            _submitInvestor();
            Navigator.pushNamed(context, 'dream');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Inversionista',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _newWorker() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          onPressed: () {
            _submitWorker();
            Navigator.pushNamed(context, 'borrower');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Trabajador',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

/*
class NewEmail extends StatefulWidget {
  @override
  _NewEmailState createState() => _NewEmailState();
}

class _NewEmailState extends State<NewEmail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: 'E-mail',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
} */

  Widget _newName() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 50, right: 50),
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          initialValue: worker.nombre,
          textCapitalization: TextCapitalization.sentences,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            labelText: 'Nombre',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onSaved: (value) => worker.nombre = value,
          validator: (value) {
            if (value.length < 3) {
              return 'Verifica el Nombre Ingresado';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget _newSurname() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 50, right: 50),
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          initialValue: worker.apellido,
          textCapitalization: TextCapitalization.sentences,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            labelText: 'Apellido',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onSaved: (value) => worker.apellido= value,
          validator: (value) {
            if (value.length < 3) {
              return 'Verifica el Apellido Ingresado';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget _newDocId() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 50, right: 50),
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          initialValue: worker.cedula,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            labelText: 'Cedula',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onSaved: (value) => worker.cedula = value,
          validator: (value) {
            if (value.length < 6) {
              return 'Ingresa tu Documento de Identidad';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget _newImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 50, right: 50),
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          initialValue: worker.imagen,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            labelText: 'Foto',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onSaved: (value) => worker.imagen = value,
        ),
      ),
    );
  }

  Widget _textNew() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0),
      child: Container(
        //color: Colors.green,
        height: 200,
        width: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            Center(
              child: Text(
                'HelpMePay es un servicio para alcanzar tus sueños',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitWorker() {

    if ( !formKey.currentState.validate() ) return;

    formKey.currentState.save();

    print( worker.nombre );
    print( worker.apellido );
    print( worker.cedula );
    print( worker.imagen );

    workerProvider.crearWorker(worker);

  }

  void _submitInvestor() {

    if ( !formKey.currentState.validate() ) return;

    formKey.currentState.save();

    print( investor.nombre );
    print( investor.apellido );
    print( investor.cedula );
    print( investor.imagen );

    investorProvider.crearInvestor(investor);
    
  }

}
