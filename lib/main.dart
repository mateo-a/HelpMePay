import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutterapp/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  
  runApp(MyApp());
  
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
      //print( prefs.token );
      print('============================');
      print( prefs.localid );
    return Provider(
      child: MaterialApp(
      title: 'HelpMePay',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      //initialRoute: 'Pay',
      // initialRoute: prefs.ultimaPagina,
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {

        print('Ruta llamada: ${settings.name}');
        
        return  MaterialPageRoute (
          builder: ( BuildContext context ) => Login()
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      )
    );  
  }
}
