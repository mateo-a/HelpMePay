import 'package:flutter/material.dart';

import 'package:flutterapp/blocs/investor_bloc.dart';
export 'package:flutterapp/blocs/investor_bloc.dart';

import 'package:flutterapp/blocs/login_bloc.dart';
export 'package:flutterapp/blocs/login_bloc.dart';

import 'package:flutterapp/blocs/workers_bloc.dart';
export 'package:flutterapp/blocs/workers_bloc.dart';

import 'package:flutterapp/blocs/loan_bloc.dart';
export 'package:flutterapp/blocs/loan_bloc.dart';

class Provider extends InheritedWidget{
  final loginBloc     = new LoginBloc();
  final _workersBloc  = new WorkersBloc();
  final _investorBloc = new InvestorBloc();
  final _loanBloc     = new LoanBloc();

  
  static Provider _instancia;

  factory Provider({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child);

  // Provider({ Key key, Widget child })  // Comentamos para mantener los Stream despúes de hotreload
  //   : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static WorkersBloc workersBloc ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>()._workersBloc;
  }

  static InvestorBloc investorBloc ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>()._investorBloc;
  }

  static LoanBloc loanBloc ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>()._loanBloc;
  }
}