import 'package:flutter/material.dart';
import 'package:flutterapp/pages/earnings_by_borrower.dart';

import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/pages/signup.dart';
import 'package:flutterapp/pages/dream.dart';
import 'package:flutterapp/widgets/moneyslider.dart';
import 'package:flutterapp/widgets/dreamdetail.dart';
import 'package:flutterapp/pages/borrower_profile.dart';
import 'package:flutterapp/pages/empty_state.dart';
import 'package:flutterapp/pages/pay_history.dart';
import 'package:flutterapp/pages/terms_service.dart';
import 'package:flutterapp/pages/earnings.dart';
import 'package:flutterapp/pages/progress_borrower.dart';
import 'package:flutterapp/pages/form.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
        'login'               : ( BuildContext context ) => Login(),
        'registro'            : ( BuildContext context ) => Registro(),
        'dream'               : ( BuildContext context ) => MyDreamHomePage(),
        'sliderDream'         : ( BuildContext context ) => MoneySlider(),
        'detailDream'         : ( BuildContext context ) => DetailPage(),
        'borrower'            : ( BuildContext context ) => BorrowerScreen(),
        'emptyState'          : ( BuildContext context ) => EmptyState(),
        'payHistory'          : ( BuildContext context ) => PayHistory(),
        'termService'         : ( BuildContext context ) => TermsService(),
        'earning'             : ( BuildContext context ) => EarningScreen(),
        'earningByBorrower'   : ( BuildContext context ) => EarningsByBorrower(),
        'progressBorrower'    : ( BuildContext context ) => ProgressBorrower(),
        'formScreen'          : ( BuildContext context ) => FormScreen(),
      };
}
