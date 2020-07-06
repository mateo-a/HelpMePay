import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/loan_model.dart';
//import 'package:flutterapp/widgets/dreamdetail.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'drawer.dart';

class MyDreamHomePage2 extends StatefulWidget {
  MyDreamHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyDreamHomePage2> {
  //Conectarse a la API y cargar datos
  Future<List<LoanModel>> _getUsers() async {
    var response = await http
        .get("https://helpmepay.rj.r.appspot.com/api/negocios/abiertos/");

    var res = json.decode(response.body);

    var jsonData = res['data'];

    List<LoanModel> loans = [];

    for (var u in jsonData) {
      final loan =
          //Loan(u["monto"], u["totalcuotas"], u["estado"], u["fechalimite"], u["titulo"], u["descripcion"]);
          u.fromJson(jsonData);
      loans.add(loan);
    }
    print(loans.length);

    return loans;
  }

  @override
  //Listar sueños
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MenuDrawer(),
      appBar: new AppBar(
        title: new Text("Financia un sueño"),
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index].picture),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: () {
                      /* Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index]))); */
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
