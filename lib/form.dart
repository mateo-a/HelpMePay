import 'package:flutter/material.dart';
import 'package:flutterapp/drawer_b.dart';
import 'borrower_profile.dart';
import 'models/loan.dart';

class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  final _loan = Loan(0,0,"","","","");
  int _amount;
  String _phoneNumber;
  String _dropdownValue;
  String _installments;
  String _story;
  bool accepted = false; 

  final _formKey = GlobalKey<FormState>();

  Widget _buildQty() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Cuánto necesitas'),
      validator: (String value){
        if (num.tryParse(value) == null ) {
          return 'Ingresa un numero válido';
        } else if (num.tryParse(value) > 1000000 || num.tryParse(value) < 50000) {
          return 'Cantidad minima: 50000, máximo: 1.000.000';
        }
        return value;
      },
      onSaved: (String value) {
        _amount = int.parse(value);
        setState(() {
        _loan.amount = _amount;
        });
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
        return value;
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
          _loan.whatFor = newValue;
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
          _loan.installments = int.parse(newValue);
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
        return value;
      },
      onSaved: (String value) {
        _story = value;
        _loan.story = value;
      },
    );
  }
  
  Future<void> _showMyDialog() async {
    print(_amount);
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalle del Préstamo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Cantidad:'),
                    Text('$_loan.amount'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Cuotas:'),
                    Text('$_loan.installments')    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Objetivo:'),
                    Text('$_loan.whatFor')  
                  ],
                ),
                
                
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
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => BorrowerScreen()),
                );
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
        drawer: MenuDrawerB(),
        appBar: AppBar(title: Text("Llena tus datos")),
        body: Form(
          key: _formKey,
          child:Container(
            child: SingleChildScrollView(
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
                      onPressed: () {
                        final form = _formKey.currentState;
                        if(form.validate()) {
                          _showMyDialog();
                          form.save();
                        }
                      },
                    ),
                  ],
                ),
              ) 
            ),
            margin: EdgeInsets.all(24),
          )
        )
      );
  }
}
