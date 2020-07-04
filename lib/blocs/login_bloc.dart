import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutterapp/blocs/validators.dart';

class LoginBloc with Validators {

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nombreController   = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();
  final _cedulaController   = BehaviorSubject<String>();

  // Recuperar datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );
  Stream<String> get nombreStream   => _nombreController.stream.transform( validarNombre );
  Stream<String> get apellidoStream => _apellidoController.stream.transform( validarApellido );
  Stream<String> get cedulaStream   => _cedulaController.stream.transform( validarCedula );
  
  // Validar formulario si entra email y password valido
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // Validar formulario si entra email, password, nombre, apellido y cedula valido
  Stream<bool> get formValidStreamRegister =>
      Rx.combineLatest5(
        emailStream,
        passwordStream,
        nombreStream,
        apellidoStream,
        cedulaStream, (e, p, n, a, c) => true);


  // Inseertar valores al  Stream
  Function(String) get changeEmail      => _emailController.sink.add;
  Function(String) get changePassword   => _passwordController.sink.add;
  Function(String) get changeNombre     => _nombreController.sink.add;
  Function(String) get changeApellido   => _apellidoController.sink.add;
  Function(String) get changeCedula     => _cedulaController.sink.add;

  // Obtener el último valor ingresado a los Streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  String get nombre   => _nombreController.value;
  String get apellido => _apellidoController.value;
  String get cedula   => _cedulaController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nombreController?.close();
    _apellidoController?.close();
    _cedulaController?.close();
  }
}