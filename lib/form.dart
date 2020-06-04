import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _amount;
  String _phoneNumber;
  String _dropdownValue;
  String _installments;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildQty() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Cuánto necesitas'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Ingresa la cantidad para el prestamo';
        }
      },
      onSaved: (String value) {
        _amount = value;
      },
    );
  }

  Widget _buildphoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Déjanos tu teléfono'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Se requiere un numero de teléfono';
        }
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildDream() {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text('Para qué es el préstamo'),
      value: _dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
      },
      items: <String>['Moto', 'Carro', 'Licencia', 'Pase']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildInstallments() {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text('A cuántas cuotas'),
      value: _installments,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          _installments = newValue;
        });
      },
      items: <String>['12', '24', '36']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalle del Préstamo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Cantidad: \t ${_amount}'),
                Text('Cuotas: \t ${_installments}'),
                Text('Para: \t ${_dropdownValue}'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                _showConfirmation();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showConfirmation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Solicitud en proceso'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Estamos procesando tu solicitud de Prestamo. Te notificaremos una vez haya sido aprobada'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Llena tus datos")),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildQty(),
                  _buildphoneNumber(),
                  _buildDream(),
                  _buildInstallments(),
                  SizedBox(height: 100),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () => {
                      _showMyDialog(),
                    },
                  ),
                ],
              ),
            )));
  }
}
