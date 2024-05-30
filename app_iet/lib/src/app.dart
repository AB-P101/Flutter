import 'package:flutter/material.dart';
//import 'package:flutter_application_1/src/pages/login/login_page.dart';
import 'package:iethasoftware/src/pages/login/login_test.dart';
import 'package:iethasoftware/src/pages/routes.dart';


final navigatorState = GlobalKey<NavigatorState>();

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CMApp",
      routes: AppRoute.all,
      home: LoginPagetest(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
