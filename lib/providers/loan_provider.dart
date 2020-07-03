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
}
