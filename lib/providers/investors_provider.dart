import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutterapp/models/investor_model.dart';


class InvestorsProvider {

  final String _url = 'https://helpmepay.rj.r.appspot.com/api/inversores';

  Future<bool> crearInvestor( InvestorModel investor ) async {

    final url = '$_url/add';
    print( investor );  
    final resp = await http.post( url, headers: {"content-type": "application/json"}, body: investorModelToJson(investor));

    final decodedData = json.decode(resp.body);
    print( decodedData );
    if ( resp.statusCode == 201 ) {
      return true;
    } else {
      return false;
    }

//    return true;

  }
}