import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/loan.dart';
import 'drawer.dart';
import 'widgets/dreamdetail.dart';

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
  Future<List<Loan>> _getUsers() async {
    var response = await http
        .get("https://helpmepay.rj.r.appspot.com/api/negocios/abiertos/");

    var jsonData = json.decode(response.body);

    List<Loan> loans = [];

    for (var u in jsonData) {
      final loan = Loan(u["monto"], u["totalcuotas"], u["estado"], u["fechalimite"], u["titulo"], u["descripcion"]);
        //u.fromJson(jsonData);
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
                          NetworkImage("NP") //(snapshot.data[index].picture),
                    ), 
                    title: Text(snapshot.data[index].titulo),
                    subtitle: Text(snapshot.data[index].descripcion),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
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

