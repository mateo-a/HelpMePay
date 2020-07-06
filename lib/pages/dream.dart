import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutterapp/pages/drawer.dart';
import 'package:flutterapp/models/loan_model.dart';
// import 'package:flutterapp/widgets/dreamdetail.dart';

//Page that loads all available dreams
class MyDreamHomePage extends StatefulWidget {
  MyDreamHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//State for the page
class _MyHomePageState extends State<MyDreamHomePage> {
  //Conectarse a la API y cargar datos
  Future<List<dynamic>> _getUsers() async {
    var response = await http
        .get("https://helpmepay.rj.r.appspot.com/api/negocios/abiertos/");

    var jsonData = json.decode(response.body);
    if (jsonData == null) return [];

    List<dynamic> loans = [];

    for (var u in jsonData) {
      var res = await http.get(
          "https://helpmepay.rj.r.appspot.com/api/workers/get/${u['worker']}");
      var dataWorer = json.decode(res.body);
      // final loan = LoanModel(u["monto"], u["totalcuotas"], u["estado"],
      //     u["fechalimite"], u["titulo"], u["descripcion"], dataWorer["imagen"]);
      // //u.fromJson(jsonData);
      // loans.add(loan);
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
        backgroundColor: Colors.blue[700],
        title: new Text("Financia un sueño"),
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
                          NetworkImage(snapshot.data[index].worker),
                    ),
                    title: Text(snapshot.data[index].titulo),
                    subtitle: Text(snapshot.data[index].descripcion),
                    onTap: () {
                      Navigator.pushNamed(context, 'detailDream',
                          arguments: snapshot.data[index]);
                      /*Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));*/
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
