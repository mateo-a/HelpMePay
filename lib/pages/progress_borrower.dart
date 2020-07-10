import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/loan_bloc.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/models/inversorsloan_model.dart';
import 'package:flutterapp/models/negociosabiertos_model.dart';
import 'package:flutterapp/models/negociosinvestor_model.dart';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutterapp/pages/drawer_b.dart';

class ProgressBorrower extends StatefulWidget {
  @override
  _ProgressBorrowerState createState() => _ProgressBorrowerState();
}

class _ProgressBorrowerState extends State<ProgressBorrower> {
  final prefs = new PreferenciasUsuario();
  LoanBloc loanBloc;
  String fecha;
  int meta;
  int aportes;

  @override
  Widget build(BuildContext context) {
    loanBloc = Provider.loanBloc(context);
    double perc = (aportes / meta);

    return Scaffold(
        drawer: MenuDrawerB(),
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text("Recaudo de fondos"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _patrocinadores(loanBloc),
                  _expira(loanBloc),
                ],
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: LinearPercentIndicator(
                      lineHeight: 24.0,
                      width: 320.0,
                      animation: true,
                      trailing: new Text(" 🤑", style: TextStyle(fontSize: 32)),
                      percent: perc,
                      animateFromLastPercent: true,
                      center: Text(
                        "\u0024$aportes",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      progressColor: Colors.green[500],
                      backgroundColor: Colors.greenAccent[100],
                    ),
                  ),
                  Center(
                    child: Text("Meta: \u0024$meta"),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                child: Card(
                  color: Colors.blueGrey[50],
                  child: const Center(
                    child: Text(
                      "Un  inversor ha contribuido con \u0024 50000, Hurra!",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  color: Colors.blueGrey[50],
                  child: const Center(
                    child: Text(
                      "Un inversor ha contribuido con \u0024 150000, Hurra!",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  color: Colors.blueGrey[50],
                  child: const Center(
                    child: Text(
                      "Un inversor ha contribuido con \u0024 50000, Hurra!",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  _patrocinadores(LoanBloc loanBloc) {
    loanBloc.inversorByLoan(prefs.negid);
    int len;
    return StreamBuilder(
        stream: loanBloc.inversorsByLoanStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<InversorsLoanModel>> snapshot) {
          if (snapshot.hasData) {
            len = snapshot.data.length;
          } else {
            len = 0;
          }
          return Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "\n🤝\n$len\nPatrocinadores",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23.0),
              ),
            ),
          );
        });
  }

  _expira(LoanBloc loanBloc) {
    loanBloc.negociosAbiertos();
    return StreamBuilder(
      stream: loanBloc.negociosAbiertosStream,
      builder: (BuildContext context,
          AsyncSnapshot<List<NegociosAbiertosModel>> snapshot) {
        if (snapshot.hasData) {
          final negocio = snapshot.data;
          for (var i = 0; i <= negocio.length; i++) {
            if (negocio[i].idfire == prefs.negid) {
              fecha = negocio[i].fechalimite;
              meta = negocio[i].monto;
              aportes = negocio[i].aportes;
              break;
            }
          }
        } else {
          return SizedBox();
        }
        return Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "\n📅\nExpira en\n$fecha",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23.0),
            ),
          ),
        );
      },
    );
  }
}
