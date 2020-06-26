import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/pages/drawer.dart';

class EarningsByBorrower extends StatefulWidget {
  EarningsByBorrower({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EarningsByBorrowerState createState() => new _EarningsByBorrowerState();
}

class _EarningsByBorrowerState extends State<EarningsByBorrower> {
  //Conectarse a la API y cargar datos
  Future<List<User>> _getUsers() async {
    var response = await http
        .get("http://www.json-generator.com/api/json/get/cezClSFMte?indent=2");

    var jsonData = json.decode(response.body);
    if ( jsonData == null ) return [];

    List<User> users = [];

    for (var u in jsonData) {
      final user = User(u["index"], u["about"], u["name"], u["email"],
          u["picture"], u["balance"]);
      //User.fromJson(jsonData);
      users.add(user);
    }
    /* for (var u in jsonData) {
    var res = await http
        .get("https://helpmepay.rj.r.appspot.com/api/workers/get/${u['worker']}");
        var dataWorer = json.decode(res.body);
      final loan = Loan(u["monto"], u["totalcuotas"], u["estado"], u["fechalimite"], u["titulo"], u["descripcion"], dataWorer["imagen"]);
        //u.fromJson(jsonData);
      loans.add(loan);
    } */
    print(users.length);

    return users;
  }

  @override
  //Listar datos
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MenuDrawer(),
      appBar: new AppBar(
        title: Text("Ganancias por inversión"),
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
                    isThreeLine: true,
                    contentPadding: EdgeInsets.all(15.0),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index].picture),
                    ),
                    title: Text(
                      snapshot.data[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'Deudor Activo\n\nLa fecha de pago está proxima\n${snapshot.data[index].email}'),
                    trailing: Text(snapshot
                        .data[index].balance), //snapshot.data[index].email),
                    onTap: () {},
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
