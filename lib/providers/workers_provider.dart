import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutterapp/models/worker_model.dart';


class WorkersProvider {

  final String _url = 'https://helpmepay.rj.r.appspot.com/api/workers';

  Future<bool> crearWorker( WorkerModel worker ) async {

    final url = '$_url/add';
    
    print( worker );  
    final resp = await http.post( url, headers: {"content-type": "application/json"}, body: workerModelToJson(worker));

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