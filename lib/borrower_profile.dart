// add in MyApp to test:
//  final daniela = new User.fromJson(json.decode(
//      '{"name": "daniela", "id": "123456", "username": "dani01", "email": "er@ero.er"}'));
import 'package:flutter/material.dart';
import 'models/user.dart';

class BorrowerScreen extends StatelessWidget {
  final User user;

  const BorrowerScreen({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Hero(
              tag: user.id,
              child: Icon(
                Icons.person,
                size: 96,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Hero(
              tag: user.username,
              child: Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      user.name,
                      textScaleFactor: 2,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Send request",
              ),
            )
          ],
        ),
      ),
    );
  }
}
