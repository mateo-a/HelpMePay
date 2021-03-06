import 'dart:convert';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {

  final String _firebaseToken = 'AIzaSyCFAqx0BFm85qmpEI1zHYfXgb7lJaFzkEY';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login( String email, String password) async {
    final authData = {
      'email'             : email,
      'password'          : password,
      'returnSecureToken' : true
    };
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode( authData )
    );
    Map<String, dynamic> decodedResp = json.decode( resp. body );
    if ( decodedResp.containsKey('idToken')){
      
        // _prefs.token    = decodedResp['idToken'];
        _prefs.localid  = decodedResp['localId'];
        _prefs.email    = email;

      return {'ok': true, 'localId': decodedResp['localId']};   // Enviar 'token': decodedResp['idToken'] para mantener Token Firebase
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  } 



  Future<Map<String, dynamic>> nuevoUsuario( String email, String password) async {
    final authData = {
      'email'             : email,
      'password'          : password,
      'returnSecureToken' : true
    };
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode( authData )
    );
    Map<String, dynamic> decodedResp = json.decode( resp. body );  
    if ( decodedResp.containsKey('idToken')){

        // _prefs.token    = decodedResp['idToken'];
        _prefs.localid  = decodedResp['localId'];
        _prefs.email    = email;
      return {'ok': true, 'localId': decodedResp['localId']};    // Enviar 'token': decodedResp['idToken'] para mantener Token Firebase
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  }
}