//import 'package:banking_app_account_ui/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/models/cuotasnegocio_model.dart';
//import 'package:flutterapp/models/loan_model.dart';
import 'package:flutterapp/models/pago_model.dart';
import 'package:flutterapp/pages/drawer_b.dart';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';

class PayHistory extends StatefulWidget {
  
  @override
  _PayHistoryState createState() => _PayHistoryState();
}

class _PayHistoryState extends State<PayHistory> {
  LoanBloc loanBloc;
  final prefs = new PreferenciasUsuario();

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
                    //_realizarPago(context, loanBloc, cuota);
                  },
                  child: Text("Selecciona la cuota a pagar",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showcontent(String cuota) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Detalle de transacción'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text(
                    'Acabas de realizar el pago de la $cuota'),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Continuar'),
              onPressed: () {
                Navigator.pop(context);
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

  _realizarPago(BuildContext context, LoanBloc loanBloc, String cuota) {
    final PagoModel pago = new PagoModel();

    pago.idcuota =  cuota;//ID Cuota
    pago.idnegocio = prefs.negid; // ID Negocio
    loanBloc.realizarPago(pago);
    _showcontent(cuota);
  }

  Widget _displayAccoutList(LoanBloc loanBloc) {
    loanBloc.cuotasNegocio(prefs.negid);
    return StreamBuilder(
        stream: loanBloc.cuotasNegocioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            //print(snapshot);
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
      if (cuotas.data.estado == "pendiente") {
        return Card(
                  child: ListTile( enabled: true,
            title: Text('Id de cuota: ${cuotas.id}'),
            isThreeLine: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            subtitle: Text(
                'Total a pagar: ${cuotas.data.valor.toString()}\nAbono a Capital: ${cuotas.data.aporte}\nAbono Intereses: ${cuotas.data.interes}\n\nFecha limite de pago: ${cuotas.data.fechapago}'),
            trailing: Text('${cuotas.data.estado}'),
            onTap: () {
              _realizarPago(context, loanBloc, '${cuotas.id}');
              setState(() {});
            }),
        );
      } else {
        return Card(
                  child: ListTile( enabled: false,
            title: Text('Id de cuota: ${cuotas.id}'),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            subtitle: Text(
                'Total a pagar: ${cuotas.data.valor.toString()}\nAbono a Capital: ${cuotas.data.aporte}\nAbono Intereses: ${cuotas.data.interes}\n\nFecha limite de pago: ${cuotas.data.fechapago}'),
            trailing: Text('${cuotas.data.estado}'),
            onTap: () {
            }),
        );
      }
        // trailing: FlatButton(
        //   color: Colors.green[500],
        //   onPressed: _realizarPago(context, loanBloc, '${cuotas.id}'),
        //   child: Text("Pagar", style: TextStyle(color: Colors.white))) //raisedButton,
      // );
  }
}
