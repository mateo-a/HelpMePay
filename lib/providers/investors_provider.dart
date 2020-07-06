import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutterapp/models/investor_model.dart';
import 'package:flutterapp/models/cargarcapital_model.dart';
import 'package:flutterapp/models/aportarnegocio_model.dart';
import 'package:flutterapp/models/datosinvestor_model.dart';
import 'package:flutterapp/models/negociosinvestor_model.dart';

class InvestorsProvider {

  final String _url = 'https://helpmepay.rj.r.appspot.com/api/inversores';

  Future<bool> crearInvestor( InvestorModel investor ) async {

    final url  = '$_url/add'; 
    final resp = await http.post( url, headers: {"content-type": "application/json"}, body: investorModelToJson(investor));

    if ( resp.statusCode == 201 || resp.statusCode == 200 ) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> agregarCapital( AgregarCapital capital ) async {

    final url  = '$_url/capital'; 
    final resp = await http.post( url, headers: {"content-type": "application/json"}, body: agregarCapitalToJson(capital));

    if ( resp.statusCode == 201 || resp.statusCode == 200 ) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> realizarAporte( AportarNegocio aporte ) async {

    final url  = '$_url/aportar'; 
    final resp = await http.post( url, headers: {"content-type": "application/json"}, body: aportarNegocioToJson(aporte));

    if ( resp.statusCode == 201 || resp.statusCode == 200 ) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<DatosInvestor>> datosInvestor( String id ) async {
    final url  = '$_url/get/$id';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<DatosInvestor> investor = new List();

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return [];

    final investorTemp = DatosInvestor.fromJson(decodedData);
    investor.add( investorTemp );
    print( investor );
    return investor;
  }

  Future<List<NegociosInvestor>> negociosInvestor( String id ) async {
    final url  = '$_url/negocios/$id';
    final resp = await http.get(url);

    final List<dynamic> decodedData = json.decode(resp.body);
    final List<NegociosInvestor> negocios = new List();

    if ( decodedData == null ) return [];
    //if ( decodedData['error'] != null ) return [];

    decodedData.forEach((id) {
      final negociosTemp = NegociosInvestor.fromJson(id);
      negocios.add( negociosTemp );
      print( negocios );
     },
    );
    return negocios;
  }
}