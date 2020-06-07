import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'models/user.dart';

class EarningsByBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Prestatario',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Prestatario'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Conectarse a la API y cargar datos
  Future<List<User>> _getUsers() async {
    var response = await http
        .get("http://www.json-generator.com/api/json/get/cezClSFMte?indent=2");

    var jsonData = json.decode(response.body);

    List<User> users = [];

    for (var u in jsonData) {
      final user = User(u["index"], u["about"], u["name"], u["email"],
          u["picture"], u["balance"]);
      //User.fromJson(jsonData);
      users.add(user);
    }
    print(users.length);

    return users;
  }

  @override
  //Listar datos
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MenuDrawer(),
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => EarningsByBorrower(),
              ),
            );
          }, //
        ),
        title: new Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.users),
          ),
        ],
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
