import 'package:flutterapp/models/cuotasnegocio_model.dart';
import 'package:flutterapp/models/inversorsloan_model.dart';
import 'package:flutterapp/models/loan_model.dart';
import 'package:flutterapp/models/negociosabiertos_model.dart';
import 'package:flutterapp/models/pago_model.dart';
import 'package:flutterapp/providers/loan_provider.dart';
import 'package:rxdart/rxdart.dart';


class LoanBloc {
  final _loanController             = new BehaviorSubject<List<LoanModel>>();
  final _negociosAbiertosController = new BehaviorSubject<List<NegociosAbiertosModel>>();
  final _cuotasNegocioController    = new BehaviorSubject<List<CuotasNegocioModel>>();
  final _inversorsByLoanController  = new BehaviorSubject<List<InversorsLoanModel>>();
  final _cargandoController         = new BehaviorSubject<bool>();

  final _loanProvider = new LoanProvider();

  Stream<List<LoanModel>> get loanStream => _loanController.stream;
  Stream<List<NegociosAbiertosModel>> get negociosAbiertosStream => _negociosAbiertosController.stream;
  Stream<List<CuotasNegocioModel>> get cuotasNegocioStream => _cuotasNegocioController.stream;
  Stream<List<InversorsLoanModel>> get inversorsByLoanStream => _inversorsByLoanController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void crearLoan( LoanModel loan ) async {
    _cargandoController.sink.add(true);
    await _loanProvider.crearLoan(loan);
    _cargandoController.sink.add(false);
  }

  void realizarPago( PagoModel pago ) async {
    _cargandoController.sink.add(true);
    await _loanProvider.realizarPago(pago);
    _cargandoController.sink.add(false);
  }

  void negociosAbiertosWorker() async {
    final negociosAbiertos = await _loanProvider.negociosAbiertosWorker();
    _negociosAbiertosController.sink.add( negociosAbiertos );
  }

  void cuotasNegocio(String id) async {
    final cuotas = await _loanProvider.cuotasNegocio(id);
    _cuotasNegocioController.sink.add( cuotas );
  }

  void inversorByLoan(String id) async {
    final inversor = await _loanProvider.inversorByLoan(id);
    _inversorsByLoanController.sink.add( inversor );
  }

  dispose() {
    _loanController?.close();
    _cargandoController?.close();
    _negociosAbiertosController?.close();
    _cuotasNegocioController?.close();
    _inversorsByLoanController?.close();
  }

}