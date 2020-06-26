import 'package:flutter/material.dart';
import 'package:flutterapp/pages/signup.dart';
import 'package:flutterapp/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelpMePay',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {

        print('Ruta llamada: ${settings.name}');
        
        return  MaterialPageRoute (
          builder: ( BuildContext context ) => NewUser()
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
