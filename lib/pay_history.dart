//import 'package:banking_app_account_ui/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/drawer_b.dart';

//void main() => runApp(MyApp());

class PayHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Historial de Pagos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Account(),
    );
  }
}

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Card topArea() => Card(
        margin: EdgeInsets.all(10.0),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Color(0xFF015FFF), Color(0xFF015FFF)])),
            padding: EdgeInsets.all(5.0),
            // color: Color(0xFF015FFF),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text("Historial de Pagos",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('Saldo Pendiente \u0024 550.000',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  ),
                ),
                SizedBox(height: 35.0),
              ],
            )),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MenuDrawerB(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blue, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
//          title: Text(
//            "Historial de Pagos",
//            style: TextStyle(color: Colors.black),
//          ),
//          centerTitle: true,
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
                    color: Color(0xFF015FFF),
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
                  color: Color(0xFF015FFF),
                  //borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                  onPressed: () {},
                  child: Text("Realizar un Pago"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
