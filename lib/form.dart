import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _amount;
  String _phoneNumber;
  String _dropdownValue;
  String _installments;
  String _story;
  bool accepted = false; 

  final _formKey = GlobalKey<FormState>();

  Widget _buildQty() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Cuánto necesitas'),
      validator: (String value){
        if (value.isEmpty) {
          return 'Ingresa la cantidad para el prestamo';
        }
        return null;
      },
      onSaved: (String value) {
        _amount = value;
      },
    );
  }

  Widget _buildphoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Déjanos tu teléfono'),
      validator: (String value){
        if (value.isEmpty) {
          return 'Se requiere un numero de teléfono';
        }
        return null;
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
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 30,
      elevation: 20,
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
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 30,
      elevation: 20,
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

  Widget _buildStory() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Cuéntanos tu historia'),
      keyboardType: TextInputType.multiline,      
      maxLines: null,
      validator: (String value){
        if (value.isEmpty) {
          return 'Deja tu historia para convencer a los inversores';
        }
        return null;
      },
      onSaved: (String value) {
        _story = value;
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalle del Préstamo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Cantidad: \t $_amount'),
                Text('Cuotas: \t $_installments'),
                Text('Para: \t $_dropdownValue'),
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
        body: Form(
          key: _formKey,
          child:Container(
            margin: EdgeInsets.all(24),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildQty(),
                  _buildphoneNumber(),
                  SizedBox(height: 16),
                  _buildDream(),
                  SizedBox(height: 16),
                  _buildInstallments(),
                  _buildStory(),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Checkbox(
                        value: accepted,
                        onChanged: (bool value) {
                          setState(() {
                            accepted = value; 
                          });
                        },
                      ), 
                      Container(
                        
                        child: Expanded(
                          child: Text("Confirmo que he leido y acepto los terminos y condiciones del servicio"), 
                        ), 
                      )
                    ]
                  ),
                  SizedBox(height: 100),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () => {
                      if(_formKey.currentState.validate()) {
                        _showMyDialog(),
                      }
                    },
                  ),
                ],
              ),
            )
          )
        )
      );
  }
}
