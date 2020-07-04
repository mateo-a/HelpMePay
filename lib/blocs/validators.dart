import 'dart:async';

class Validators {

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ) {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if ( regExp.hasMatch( email ) ){
        sink.add( email );
      } else {
        sink.addError('Ingrese un email valido');
      }
    }
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ) {
      if ( password.length >= 6 ) {
        sink.add( password );
      } else {
        sink.addError('Ingrese más de 6 caracteres por favor');
      }
    }
  );

  final validarNombre = StreamTransformer<String, String>.fromHandlers(
    handleData: ( nombre, sink ) {
      if ( nombre.length >= 2 ) {
        sink.add( nombre );
      } else {
        sink.addError('Ingrese su nombre por favor');
      }
    }
  );

  final validarApellido = StreamTransformer<String, String>.fromHandlers(
    handleData: ( apellido, sink ) {
      if ( apellido.length >= 2 ) {
        sink.add( apellido );
      } else {
        sink.addError('Ingrese su apellido por favor');
      }
    }
  );

  final validarCedula = StreamTransformer<String, String>.fromHandlers(
    handleData: ( cedula, sink ) {
      if ( cedula.length >= 5 ) {
        sink.add( cedula );
      } else {
        sink.addError('Ingrese su docuemto de identidad');
      }
    }
  );
}