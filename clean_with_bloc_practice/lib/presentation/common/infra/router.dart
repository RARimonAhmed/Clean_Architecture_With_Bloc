import 'package:flutter/material.dart';
import 'package:clean_with_bloc_practice/main.dart';
import 'package:clean_with_bloc_practice/presentation/home/home_page.dart';
import 'package:clean_with_bloc_practice/presentation/login/login_page.dart';
import 'package:clean_with_bloc_practice/presentation/register/register.page.dart';
import 'package:clean_with_bloc_practice/presentation/splash/splash.page.dart';

class AppRouter {
  static const ROUTE_SPLASH = "/splash";
  static const ROUTE_LOGIN = "/login";
  static const ROUTE_HOME = "/home";
  static const ROUTE_REGISTER = "/register";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_SPLASH:
        return MaterialPageRoute(builder: (_) =>  SplashPage(deviceInfoBloc: sl.get(),));
      case ROUTE_LOGIN:
        return MaterialPageRoute(builder: (_) => LoginPage(loginBloc: sl.get()));
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => HomePage());
      case ROUTE_REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterPage(registerBloc: sl()));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text("No route"))));
    }
  }
}