import 'package:flutter/material.dart';
import 'package:flutterapp/blocs/provider.dart';
import 'package:flutterapp/models/investor_model.dart';
import 'package:flutterapp/preferencias_usuario/preferencias_usuario.dart';
//import 'earnings.dart';

// Sidebar menu for all the views of the lender menu
class MenuDrawer extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    final investorBloc = Provider.investorBloc(context);

    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: _creaNombre(investorBloc),
              accountEmail: Text(prefs.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.people), 
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text('Agrega Fondos\na tu Cuenta'),
              onTap: () {
                Navigator.pushNamed(context, 'funds');
               /* Navigator.push(context, 
                MaterialPageRoute(builder: (context) => MyDreamHomePage())); */
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Financia un sueño'),
              onTap: () {
                Navigator.pushNamed(context, 'dream');
               /* Navigator.push(context, 
                MaterialPageRoute(builder: (context) => MyDreamHomePage())); */
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Ganancias'),
              onTap: (){
                Navigator.pushNamed(context, 'earning');
                /* Navigator.push(context, 
                MaterialPageRoute(builder: (context) => EarningScreen())); */
              }
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Financiados'),
              onTap: (){
                Navigator.pushNamed(context, 'earningByBorrower');
               /* Navigator.push(context, 
                MaterialPageRoute(builder: (context) => EarningsByBorrower())); */
              }
            ),  // ListTile
            ListTile(
              leading: Icon(Icons.priority_high),
              title: Text('Terminos y condiciones'),
              onTap: () {
                Navigator.pushNamed(context, 'termService');
              /*  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => TermsService())); */
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'login');
              /*  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => TermsService())); */
              },
            ),
          ],
        ),
    );
  }

  Widget _creaNombre(InvestorBloc investorBloc) {
    return StreamBuilder(
      stream: investorBloc.investorStream,
      builder: (BuildContext context, AsyncSnapshot<List<InvestorModel>> snapshot){
        if (snapshot.hasData) {
          final investor = snapshot.data;
          return Text(investor[0].nombre+' '+investor[0].apellido);
          } else {
            return Center( child: CircularProgressIndicator());
        }
      },
    );
  }
}