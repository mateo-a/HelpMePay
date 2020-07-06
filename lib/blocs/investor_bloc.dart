import 'package:flutterapp/models/aportarnegocio_model.dart';
import 'package:flutterapp/models/cargarcapital_model.dart';
import 'package:flutterapp/models/datosinvestor_model.dart';
import 'package:flutterapp/models/investor_model.dart';
import 'package:flutterapp/models/negociosinvestor_model.dart';
import 'package:flutterapp/providers/investors_provider.dart';
import 'package:rxdart/rxdart.dart';

class InvestorBloc {

  final _investorController         = new BehaviorSubject<List<InvestorModel>>();
  final _investorDatosController    = new BehaviorSubject<List<DatosInvestor>>();
  final _investorNegociosController = new BehaviorSubject<List<NegociosInvestor>>();
  final _cargandoController         = new BehaviorSubject<bool>();

  final _investorProvider = new InvestorsProvider();

  Stream<List<InvestorModel>> get investorStream => _investorController.stream;
  Stream<List<DatosInvestor>> get investorDatosStream => _investorDatosController.stream;
  Stream<List<NegociosInvestor>> get investorNegociosStream => _investorNegociosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void agregarInvestor( InvestorModel investor ) async {
    _cargandoController.sink.add(true);
    await _investorProvider.crearInvestor(investor);
    _cargandoController.sink.add(false);
  }

  void agregarCapital( AgregarCapital capital ) async {
    _cargandoController.sink.add(true);
    await _investorProvider.agregarCapital(capital);
    _cargandoController.sink.add(false);
  }

  void realizarAporte( AportarNegocio aporte ) async {
    _cargandoController.sink.add(true);
    await _investorProvider.realizarAporte(aporte);
    _cargandoController.sink.add(false);
  }

  void datosInvestor(String id) async {
    final investor = await _investorProvider.datosInvestor(id);
    _investorDatosController.sink.add( investor );
  }

  void negociosInvestor(String id) async {
    final negocios = await _investorProvider.negociosInvestor(id);
    _investorNegociosController.sink.add( negocios );
  }

  dispose() {
    _investorController?.close();
    _cargandoController?.close();
    _investorDatosController?.close();
    _investorNegociosController?.close();
  }

}