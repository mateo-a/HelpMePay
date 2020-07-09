import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/models/negociosabiertos_model.dart';
//import 'package:flutterapp/models/worker_model.dart';
import 'package:flutterapp/pages/drawer.dart';

//Page that loads all available dreams
class MyDreamHomePage extends StatefulWidget {
  MyDreamHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//State for the page
class _MyHomePageState extends State<MyDreamHomePage> {
  //InvestorBloc investorBloc;
  LoanBloc loanBloc;
  WorkersBloc workersBloc;

  @override
  //Listar sueños
  Widget build(BuildContext context) {
    loanBloc = Provider.loanBloc(context);
    workersBloc = Provider.workersBloc(context);
    loanBloc.negociosAbiertos();

    return new Scaffold(
      drawer: MenuDrawer(),
      appBar: new AppBar(
        backgroundColor: Colors.blue[700],
        title: new Text("Financia un sueño"),
      ),
      body: _crearListado(loanBloc),
    );
  }

  Widget _crearListado(LoanBloc loanBloc) {
    return StreamBuilder(
      stream: loanBloc.negociosAbiertosStream,
      builder: (BuildContext context, AsyncSnapshot<List<NegociosAbiertosModel>>snapshot){
        //print(snapshot.data);
        if (snapshot.data == null) {
          return Container(child: Center(child: CircularProgressIndicator()));
        } else {
          final negociosAbiertos = snapshot.data;
          if (negociosAbiertos.length > 0) {
            return ListView.builder(
              itemCount: negociosAbiertos.length,
              itemBuilder: (BuildContext context, int index) => _crearItem(context, loanBloc, negociosAbiertos[index]),
            );
          } else {
            return Center(child: Text('No hay solicitudes abiertas'));
          }
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, LoanBloc loanBloc, NegociosAbiertosModel negociosAbiertos) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/52.jpg')),
      title: Text(negociosAbiertos.titulo),
      subtitle: Text(negociosAbiertos.descripcion),
      onTap: () {
        Navigator.pushNamed(context, 'detailDream',
            arguments: negociosAbiertos);
      },
    );
  }
}
