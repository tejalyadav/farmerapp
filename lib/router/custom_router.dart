import 'package:flutter/material.dart';
//import 'package:farmerapp/pages/about_page.dart';
import 'package:farmerapp/pages/home_page.dart';
//import 'package:farmerapp/pages/not_found_page.dart';
//import 'package:farmerapp/pages/settings_page.dart';
import 'package:farmerapp/router/route_constants.dart';
import 'package:farmerapp/pages/firstscreen.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case firstscreenRoute:
        return MaterialPageRoute(builder: (_) =>  FirstScreen());
      //case settingsRoute:
        //return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}