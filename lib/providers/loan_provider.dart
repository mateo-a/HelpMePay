import 'dart:convert';
import 'package:flutterapp/models/cuotasnegocio_model.dart';
import 'package:flutterapp/models/inversorsloan_model.dart';
import 'package:flutterapp/models/negociosabiertos_model.dart';
import 'package:flutterapp/models/pago_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutterapp/models/loan_model.dart';

class LoanProvider {
  final String _url = 'https://helpmepay.rj.r.appspot.com/api/negocios';

  Future<bool> crearLoan(LoanModel newLoan) async {
    final url = '$_url/add';
    final resp = await http.post(url,
        headers: {"content-type": "application/json"},
        body: loanModelToJson(newLoan));

    if (resp.statusCode == 201 || resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> realizarPago( PagoModel pago ) async {

    final url  = '$_url/pago'; 
    final resp = await http.post( url, headers: {"content-type": "application/json"}, body: pagoModelToJson(pago));

    if ( resp.statusCode == 201 || resp.statusCode == 200 ) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<NegociosAbiertosModel>> negociosAbiertosWorker() async {
    final url  = '$_url/abiertos';
    final resp = await http.get(url);
    
    final List<dynamic> decodedData = json.decode(resp.body);
    final List<NegociosAbiertosModel> negocios = new List();
    
    if ( decodedData == null ) return [];
    //if ( decodedData['error'] != null ) return [];
    
    decodedData.forEach(( id ) {
      final negocioAbiertoTemp = NegociosAbiertosModel.fromJson(id);
      negocios.add( negocioAbiertoTemp );     
      },
    );
    return negocios;
  }

  Future<List<CuotasNegocioModel>> cuotasNegocio( String id ) async {
    final url  = '$_url/cuotas/$id';
    final resp = await http.get(url);

    final List<dynamic> decodedData = json.decode(resp.body);
    final List<CuotasNegocioModel> cuotas = new List();

    if ( decodedData == null ) return [];
    //if ( decodedData['error'] != null ) return [];

    decodedData.forEach((id) {
      final cuotasTemp = CuotasNegocioModel.fromJson(id);
      cuotas.add( cuotasTemp );
      print( cuotas );
     },
    );
    return cuotas;
  }

  Future<List<InversorsLoanModel>> inversorByLoan( String id ) async {
    final url  = '$_url/inversionista/$id';
    final resp = await http.get(url);

    final List<dynamic> decodedData = json.decode(resp.body);
    final List<InversorsLoanModel> investor = new List();

    if ( decodedData == null ) return [];
    //if ( decodedData['error'] != null ) return [];

    decodedData.forEach((id) {
      final investorTemp = InversorsLoanModel.fromJson(id);
      investor.add( investorTemp );
      print( investor );
     },
    );
    return investor;
  }

}
