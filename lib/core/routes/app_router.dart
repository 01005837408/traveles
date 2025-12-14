import 'package:flutter/material.dart';
import 'package:traveles/core/routes/routes_constant.dart';
import 'package:traveles/feature/authentaction/business_logic/cubit/phone_auth_cubit.dart';
import 'package:traveles/feature/authentaction/presentation/screens/login_screen.dart';
import 'package:traveles/feature/authentaction/presentation/screens/otp_screen.dart';

class AppRouter {
  PhoneAuthCubit phoneAuthCubit;
  const AppRouter({
    phoneAuthCubit = PhoneAuthCubit(),
  });
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case ConstantRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ConstantRoutes.otp:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case ConstantRoutes.mapScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
