//import 'package:banking_app_account_ui/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/models/cuotasnegocio_model.dart';
//import 'package:flutterapp/models/loan_model.dart';
import 'package:flutterapp/models/pago_model.dart';
import 'package:flutterapp/pages/drawer_b.dart';

class PayHistory extends StatefulWidget {
  @override
  _PayHistoryState createState() => _PayHistoryState();
}

class _PayHistoryState extends State<PayHistory> {
  LoanBloc loanBloc;

  Card topArea() => Card(
        margin: EdgeInsets.all(10.0),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Container(
            color: Colors.blue[700],
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('Saldo Pendiente',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('\u0024550.000',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30.0)),
                  ),
                ),
              ],
            )),
      );

  @override
  Widget build(BuildContext context) {
    loanBloc = Provider.loanBloc(context);
    return SafeArea(
      child: Scaffold(
        drawer: MenuDrawerB(),
        appBar: AppBar(
          title: Text("Lista de Cuotas"),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.blue[700],
          elevation: 0.0,
        ),
        body: _displayAccoutList(loanBloc),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.green[500],
                  onPressed: () {
                    _realizarPago(context, loanBloc);
                  },
                  child: Text("Realizar un Pago",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _realizarPago(BuildContext context, LoanBloc loanBloc) {
    final PagoModel pago = new PagoModel();

    pago.idcuota = "cuota2"; //ID Cuota
    pago.idnegocio = "woOlgcKsxaxLsJf52WXX"; // ID Negocio

    loanBloc.realizarPago(pago);
  }

  Widget _displayAccoutList(LoanBloc loanBloc) {
    loanBloc.cuotasNegocio("ENWTpce6OxCFQRgy1rMu");
    return StreamBuilder(
        stream: loanBloc.cuotasNegocioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot);
            final cuotas = snapshot.data;
            return ListView.builder(
              itemCount: cuotas.length,
              itemBuilder: (BuildContext context, int index) =>
                  _crearItem(context, loanBloc, cuotas[index]),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _crearItem(
      BuildContext context, LoanBloc loanBloc, CuotasNegocioModel cuotas) {
    var raisedButton = RaisedButton(
        color: Colors.green[500],
        onPressed: _realizarPago(context, loanBloc),
        child: Text("Pagar", style: TextStyle(color: Colors.white)));
    return ListTile(
      title: Text('id de cuota: ${cuotas.id}'),
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      subtitle: Text(
          'total a pagar: ${cuotas.data.aporte.toString()}\nfecha de pago: ${cuotas.data.fechapago}'),
      trailing: raisedButton,
    );
  }
}
