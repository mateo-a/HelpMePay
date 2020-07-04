import 'package:flutter/material.dart';
import 'drawer_b.dart';
//import 'models/user.dart';

class BorrowerScreen extends StatelessWidget {
  //final User user;

  // const BorrowerScreen({Key key, @required this.user})
  //     : assert(user != null),
  //       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawerB(),
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Member Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Container(
              color: Colors.blue,
              height: 400,
              child: Icon(
                Icons.person,
                size: 96,
                color: Colors.white,
              ),
            ),
            Container(
              child: Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      "Lenora Martinez",
                      //user.name,
                      textScaleFactor: 2,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('Make a Payment'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
