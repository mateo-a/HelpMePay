import 'package:flutter/material.dart';
import 'package:flutterapp/drawer_b.dart';
import 'borrower_profile.dart';
import 'models/loan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//This class contains the construction parameters of the form screen
class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  int _amount;
  String _phoneNumber;
  String _titulo;
  String _installments;
  String _story;
  bool accepted = false;
  String expiration = (DateTime.now().add(Duration(days: 30)).toString()); 

  // This widget creates a new card with the info of a loan 
  Future<Loan> crearNegocio(String titulo, String fechalimite, String worker, String monto, String descripcion, String totalcuotas) async {
    final http.Response response = await http.post(
      'https://helpmepay.rj.r.appspot.com/api/negocios/add',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'titulo': titulo,
        'fechalimite': fechalimite,
        'worker': worker,
        'monto': monto,
        'descripcion': descripcion,
        'totalcuotas': totalcuotas
      }),
    );
    if (response.statusCode == 201) {
      return Loan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Creación de prestamo fallida');
    }
  }

  final _formKey = GlobalKey<FormState>();

  //textformfield to write the amount for loan 
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
      onChanged: (String value) {
        _amount = int.parse(value);
      },
    );
  }

  // this is the constructor of the fromfield to enter phone number 
  Widget _buildphoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Déjanos tu teléfono'),
      validator: (String value){
        if (value.isEmpty) {
          return 'Se requiere un numero de teléfono';
        }
        return value;
      },
      onChanged: (String value) {
        _phoneNumber = value;
        },
    );
  }

  // theis is the constructor for the dropdown form list for available dreams 
  Widget _buildDream() {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text('Para qué es el préstamo'),
      value: _titulo,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 30,
      elevation: 20,
      onChanged: (String newValue) {
        setState(() {
          _titulo = newValue;
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

  // constructor for the dropdown to select the number of installments 
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
      items: <String>['12', '24', '36'] // installments available
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  //constructs the textarea for the user to write his/her story
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
      onChanged: (String value) {
        _story = value;
      },
    );
  }
  
  // and async widget that builds the 
  Future<void> _showMyDialog() async {
    print(_amount);
    return showDialog<void>(
      context: context,
      barrierDismissible: true, 
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
                    Text('$_amount'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Cuotas:'),
                    Text('$_installments')    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Objetivo:'),
                    Text('$_titulo')  
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
                crearNegocio(_titulo, "81234568", expiration, _amount.toString(), _story, _installments);
              },
            ),
          ],
        );
      },
    );
  }

  // this constructior builds the confirmation message after loan details have been confirmed 
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

  // the constructor that shows it all together. 
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
