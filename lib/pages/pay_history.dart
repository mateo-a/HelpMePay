//import 'package:banking_app_account_ui/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/provider.dart';
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
          title: Text("Historial de pagos"),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.blue[700],
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                topArea(),
                SizedBox(
                  height: 40.0,
                  child: Icon(
                    Icons.refresh,
                    size: 35.0,
                    color: Colors.blue[700],
                  ),
                ),
                displayAccoutList(),
              ],
            ),
          ),
        ),
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
                  //borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                  onPressed: () {_realizarPago(context, loanBloc);},
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

    pago.idcuota   = "cuota2";                    //ID Cuota
    pago.idnegocio = "woOlgcKsxaxLsJf52WXX";      // ID Negocio

    loanBloc.realizarPago(pago);
  }

  Container accountItems(
          String item, String charge, String dateString, String type,
          {Color oddColour = Colors.white}) =>
      Container(
        decoration: BoxDecoration(color: oddColour),
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(item, style: TextStyle(fontSize: 16.0)),
                Text(charge, style: TextStyle(fontSize: 16.0))
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dateString,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                Text(type, style: TextStyle(color: Colors.grey, fontSize: 14.0))
              ],
            ),
          ],
        ),
      );

  displayAccoutList() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          accountItems("Transferencia", r"+ $ 40.000", "24-05-21", "",
              oddColour: const Color(0xFFF7F7F9)),
          accountItems("Transferencia", r"+ $ 550.000", "28-06-21", ""),
          accountItems("Consignación", r"+ $ 50.000", "25-07-21", "",
              oddColour: const Color(0xFFF7F7F9)),
          accountItems("Transferencia", r"+ $ 200.000", "28-08-21", ""),
          accountItems("Transferencia", r"+ $ 150.000", "16-09-21", "",
              oddColour: const Color(0xFFF7F7F9)),
        ],
      ),
    );
  }
}
