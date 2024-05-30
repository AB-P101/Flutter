import 'dart:html';

import 'package:flutter/material.dart';
import 'package:iethasoftware/src/pages/register/register_page.dart';

import 'home/add_hmin_.dart';
import 'home/home_Report.dart';
import 'home/home_in_product.dart';
import 'home/home_main.dart';
import 'home/home_out_product.dart';
import 'loading/loading.dart';
import 'loading/loadingFlexSim.dart';
import 'login/login_test.dart';
import 'txt/date_picker.dart';


/*String token_() {
  return "6334-2403-6200-8820-3c1a-c188-6be9-e5be-5066.ngrok-free.app";
}*/

class AppRoute {
  static const homeout = 'homeout';
  static const homein = 'homein';
  static const login2 = 'login2';
  static const register = 'register';
  static const homemain = 'homemain';
  static const homereport = 'homereport';
  static const loading = 'loading';
  static const loadingFlex = 'loadingFlex';
  static const page_add = 'page_add';
  static const date_picker_ = 'date_picker_';

  static get all => <String, WidgetBuilder>{
        register: (context) => const RegisterPage(),
        homemain:(context) => const HomePage_(),
        homereport:(context) => const HomeReport(),
        homein: (context) => const HomeIN_(),
        homeout: (context) => const HomeOut_(),
        loading: (context) => const loading_(),
        loadingFlex: (context) =>  const loading_flex(),
        login2: (context) => const LoginPagetest(),
        page_add: (context) => const add_in(),
        date_picker_: (context) => const datePage(),
      };
}
