import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/user.dart';
import 'drawer.dart';


class MyDreamHomePage extends StatefulWidget {
  MyDreamHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyDreamHomePage> {
  //Conectarse a la API y cargar datos
  Future<List<User>> _getUsers() async {
    var response = await http
        .get("http://www.json-generator.com/api/json/get/cfSVlomvTm?indent=2");

    var jsonData = json.decode(response.body);

    List<User> users = [];

    for (var u in jsonData) {
      final user =
          User(u["index"], u["about"], u["name"], u["email"], u["picture"], u["balance"]);
      //User.fromJson(jsonData);
      users.add(user);
    }
    print(users.length);

    return users;
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
                          NetworkImage(snapshot.data[index].picture),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
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

class DetailPage extends StatelessWidget {
//Detalle de sueño/historia
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(user.picture),
            ),
          ),
          Container(
            child: Wrap(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      user.about,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.blue,
            ),
          ),
          Container(
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  child: Text('Expira pronto'),
                  onPressed: (){},
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MoneySlider()));
                  },
                  child: Text('Ayudalo!'),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class MoneySlider extends StatefulWidget {
  @override
  _MoneySliderState createState() => _MoneySliderState();
}

class _MoneySliderState extends State<MoneySlider> {
  var sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    void _showcontent() {
      showDialog(
        context: context, barrierDismissible: false, // user must tap button!

        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Detalle de transacción'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: [
                  new Text(
                      'Usted acaba de aportar \u0024$sliderValue para ayudar a este worker.\n\nPuedes seguir ayudando a otros Workers.'),
                ],
              ),
            ),
            actions: [
              new FlatButton(
                child: new Text('Continuar'),
                onPressed: () {
                  Navigator.push(
                    context,
                     MaterialPageRoute(
                      builder: (context) => MyDreamHomePage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text("Financia a este worker"),
      ),
      drawer: MenuDrawer(),
      body: Container(
        color: Color(0xffE5E5E5),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    child: Text(
                  "¿Con cuánto deseas contribuir?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      width: 350.0,
                      height: 200.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Slider(
                                min: 0.0,
                                max: 1000000.0,
                                divisions: 20,
                                value: sliderValue,
                                activeColor: Colors.blue[900],
                                inactiveColor: Colors.blue[100],
                                onChanged: (newValue) {
                                  setState(() {
                                    sliderValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                child: Text(
                              "Su contribución : \u0024$sliderValue",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Colors.blue,
                                child: Text('Confirmar',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: _showcontent,
                              ),
                            )),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
