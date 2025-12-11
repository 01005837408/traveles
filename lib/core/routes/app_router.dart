import 'package:flutter/material.dart';
import 'package:traveles/core/routes/routes_constant.dart';
import 'package:traveles/feature/presentation/screens/login_screen.dart';

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings,){
    switch(settings.name  ){

      case ConstantRoutes.login :
           return MaterialPageRoute(builder: (_) => const LoginScreen());
    
      default :
           return MaterialPageRoute(builder: (_) => const LoginScreen());
       
    }
  }
}