import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutterapp/models/worker_model.dart';
import 'package:flutterapp/models/workernegocio_model.dart';

class WorkersProvider {

  final String _url = 'https://helpmepay.rj.r.appspot.com/api/workers';

  Future<bool> crearWorker( WorkerModel worker ) async {

    final url = '$_url/add';
    final resp = await http.post( url, headers: {"content-type": "application/json"}, body: workerModelToJson(worker));
  
    if ( resp.statusCode == 201 || resp.statusCode == 200 ) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<WorkerModel>> cargarWorker( String id ) async {
    final url  = '$_url/get/$id';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<WorkerModel> worker = new List();
    
    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return [];

    final workerTemp = WorkerModel.fromJson(decodedData);
    worker.add( workerTemp );
    print( worker );
    return worker;
  }

  Future<List<WorkerNegocios>> cargarNegociosWorker( String id ) async {
    final url  = '$_url/negocios/$id';
    final resp = await http.get(url);
    
    final List<dynamic> decodedData = json.decode(resp.body);
    final List<WorkerNegocios> negocios = new List();
    
    if ( decodedData == null ) return [];
    //if ( decodedData['error'] != null ) return [];
    
    decodedData.forEach(( id ) {
      final negocioworkerTemp = WorkerNegocios.fromJson(id);
      negocios.add( negocioworkerTemp );     
      },
    );
    return negocios;
  }
}