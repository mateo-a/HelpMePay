import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/investor_bloc.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/models/aportarnegocio_model.dart';
import 'package:flutterapp/models/negociosabiertos_model.dart';

//import 'package:flutterapp/pages/dream.dart';
//import 'package:flutterapp/pages/dream2.dart';
import 'package:flutterapp/pages/drawer.dart';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';

class MoneySlider extends StatefulWidget {
  @override
  _MoneySliderState createState() => _MoneySliderState();
}

class _MoneySliderState extends State<MoneySlider> {
  final prefs = new PreferenciasUsuario();
  InvestorBloc investorBloc;
  var sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final NegociosAbiertosModel loan = ModalRoute.of(context).settings.arguments;
    investorBloc = Provider.investorBloc(context);
    _realizarAporte(BuildContext context, InvestorBloc investorBloc) {
      final AportarNegocio aporte = new AportarNegocio();

      aporte.idnegocio       = loan.idfire;
      aporte.idinversionista = prefs.localid;            //Actualizado con ID real del inversionista
      aporte.aporte          = sliderValue.toInt();

      investorBloc.realizarAporte(aporte);
    }
    void _showcontent() {
      showDialog(
        context: context, barrierDismissible: false, // user must tap button!

        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Detalle de transacción'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: [
                  new Text(
                      'Acabas de aportar \u0024${sliderValue.toInt()} para ayudar a este worker.\n\nPuedes seguir ayudando a otros Workers.'),
                ],
              ),
            ),
            actions: [
              new FlatButton(
                child: new Text('Continuar'),
                onPressed: () {
                  Navigator.pushNamed(context, 'dream');
                  /*Navigator.push(
                    context,
                     MaterialPageRoute(
                      builder: (context) => MyDreamHomePage(),
                    ),
                  ); */
                },
              ),
            ],
          );
        },
      );
    }

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Financia a este worker"),
      ),
      drawer: MenuDrawer(),
      body: Container(
        color: Color(0xffE5E5E5),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    child: Text(
                  "¿Con cuánto deseas contribuir?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(height: 90.0),
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      width: 350.0,
                      height: 280.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Slider(
                                min: 0,
                                max: 1000000,
                                divisions: 20,
                                value: sliderValue,
                                activeColor: Colors.blue[700],
                                inactiveColor: Colors.blue[100],
                                onChanged: (newValue) {
                                  setState(() {
                                    sliderValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                child: Text(
                              "💵 Tu contribución",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                child: Text(
                              "\u0024${sliderValue.toInt()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Colors.blue,
                                child: Text('Confirmar',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                                onPressed:(){_showcontent();
                                _realizarAporte(context, investorBloc);
                                },
                              ),
                            )),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
