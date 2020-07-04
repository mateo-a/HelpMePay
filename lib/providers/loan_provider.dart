import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutterapp/models/loan.dart';

class LoanProvider {
  final String _url = 'https://helpmepay.rj.r.appspot.com/api/negocios';

  Future<bool> crearLoan(Loan newLoan) async {
    final url = '$_url/add';

    print(newLoan);
    final resp = await http.post(url,
        headers: {"content-type": "application/json"},
        body: loanToJson(newLoan));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    if (resp.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<Loan> crearNegocio(String titulo, String fechalimite, String worker,
      String monto, String descripcion, String totalcuotas) async {
    final http.Response response = await http.post(
      'https://helpmepay.rj.r.appspot.com/api/negocios/add',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'titulo': titulo,
        'fechalimite': fechalimite,
        'worker': worker,
        'monto': monto,
        'descripcion': descripcion,
        'totalcuotas': totalcuotas
      }),
    );
    if (response.statusCode == 201) {
      return Loan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Creación de prestamo fallida');
    }
  }
}
