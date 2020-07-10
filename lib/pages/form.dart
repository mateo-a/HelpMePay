import 'package:flutter/material.dart';
import 'package:flutterapp/models/loan_model.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';
import 'package:intl/intl.dart';

//This class contains the construction parameters of the form screen
class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  final prefs = new PreferenciasUsuario();
  LoanBloc loanBloc;
  int _amount;
  String _titulo;
  String _installments;
  String _story;
  bool isAccepted = false;
  String expiration = DateFormat('dd-MM-yyyy')
      .format(DateTime.now().add(Duration(days: 30)))
      .toString();

  final _formKey = GlobalKey<FormState>();

  //textformfield to write the amount for loan
  Widget _buildQty() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Cuánto necesitas'),
      validator: (String value) {
        if (num.tryParse(value) == null) {
          return 'Ingresa un numero válido';
        } else if (num.tryParse(value) > 1000000 ||
            num.tryParse(value) < 50000) {
          return 'Cantidad minima: 50000, máximo: 1.000.000';
        }
        return value;
      },
      onChanged: (String value) {
        _amount = int.parse(value);
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
      items: <String>[
        '🛵 Moto',
        '🚲 Bicicleta',
        '💳 Licencia',
        '🔒 Seguro',
        '🎒 Equipamiento'
      ].map<DropdownMenuItem<String>>((String value) {
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
      items: <String>['6', '12', '24', '36'] // installments available
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
      validator: (String value) {
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
                  children: [Text('Cuotas:'), Text('$_installments')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('Objetivo:'), Text('$_titulo')],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () {
                _showConfirmation();
                _crearNegocio(_amount, _titulo, prefs.localid, expiration, _story,
                    _installments);
              },
            ),
          ],
        );
      },
    );
  }

/* 
* Function that creates a new loan for the worker
*/
  _crearNegocio(int monto, String titulo, String idworker, String fechalimite,
      String descripcion, String totalcuotas) {
    final totcuota = int.parse(totalcuotas);
    final LoanModel loan = new LoanModel();

    loan.descripcion = descripcion;
    loan.fechalimite = fechalimite;
    loan.monto = monto;
    loan.titulo = titulo;
    loan.totalcuotas = totcuota;
    loan.worker = idworker;

    loanBloc.crearLoan(loan);
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
                Navigator.pushNamed(context, 'borrower');
                /*Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => BorrowerScreen()),
                );*/
              },
            ),
          ],
        );
      },
    );
  }

  _enableButton(){
    setState(() {
      isAccepted = true;
    });
  }
  // the constructor that shows it all together.
  @override
  Widget build(BuildContext context) {
    loanBloc = Provider.loanBloc(context);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue[700], title: Text("Llena tus datos")),
        body: Form(
            key: _formKey,
            child: Container(
              child: SingleChildScrollView(
                  child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildQty(),
                    SizedBox(height: 16),
                    _buildDream(),
                    SizedBox(height: 16),
                    _buildInstallments(),
                    _buildStory(),
                    SizedBox(height: 20),
                    Row(children: [
                      Checkbox(
                        value: isAccepted,
                        onChanged: (bool value) {
                          _enableButton();
                        },
                      ),
                      Container(
                        child: Expanded(
                          child: Text(
                              "Confirmo que he leido y acepto los terminos y condiciones del servicio"),
                        ),
                      )
                    ]),
                    SizedBox(height: 100),
                    RaisedButton(
                      color: Colors.green[500],
                      child: Text(
                        'Enviar',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      onPressed: isAccepted ? () {
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          _showMyDialog();
                          form.save();
                        }
                      } : null,
                    ),
                  ],
                ),
              )),
              margin: EdgeInsets.all(24),
            )));
  }
}
