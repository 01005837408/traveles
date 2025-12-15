import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveles/core/routes/routes_constant.dart';
import 'package:traveles/feature/authentaction/business_logic/cubit/phone_auth_cubit.dart';
import 'package:traveles/feature/authentaction/presentation/screens/login_screen.dart';
import 'package:traveles/feature/authentaction/presentation/screens/map_screen.dart';
import 'package:traveles/feature/authentaction/presentation/screens/otp_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case ConstantRoutes.login:
      final phoneNumber = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: PhoneAuthCubit(),
                  child:   LoginScreen(
                    phoneNumber: phoneNumber.toString()
                  ),
                ));
      case ConstantRoutes.otp:
      final otpCode = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: PhoneAuthCubit(),
                  child:   OtpScreen(
                    otpCode: otpCode.toString(),
                  ),
                ));
      case ConstantRoutes.mapScreen:
        return MaterialPageRoute(
            builder: (_) =>   MapScreen());

      default:
        return MaterialPageRoute(builder: (_) =>   OtpScreen(
              otpCode: '',
        ));
    }
  }
}
