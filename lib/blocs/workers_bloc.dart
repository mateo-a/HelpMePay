import 'package:rxdart/rxdart.dart';

import 'package:flutterapp/models/worker_model.dart';
import 'package:flutterapp/providers/workers_provider.dart';
import 'package:flutterapp/models/workernegocio_model.dart';


class WorkersBloc {

  final _workersController        = new BehaviorSubject<List<WorkerModel>>();
  final _workernegocioController  = new BehaviorSubject<List<WorkerNegocios>>();
  final _cargandoController       = new BehaviorSubject<bool>();

  final _workersProvider          = new WorkersProvider();

  Stream<List<WorkerModel>> get workersStream => _workersController.stream;
  Stream<List<WorkerNegocios>> get workernegocioStream => _workernegocioController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void agregarWorker( WorkerModel worker ) async {
    _cargandoController.sink.add(true);
    await _workersProvider.crearWorker(worker);
    _cargandoController.sink.add(false);
  }

  void cargarNegociosWorker(String id) async {
    final workerNegocios = await _workersProvider.cargarNegociosWorker(id);
    _workernegocioController.sink.add( workerNegocios );
  }

  void cargarWorker(String id) async {
    final worker = await _workersProvider.cargarWorker(id);
    _workersController.sink.add( worker );
  }

  dispose() {
    _workersController?.close();
    _cargandoController?.close();
    _workernegocioController?.close();
  }

}