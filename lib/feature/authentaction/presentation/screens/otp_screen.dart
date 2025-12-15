import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveles/core/function.dart';
import 'package:traveles/core/routes/routes_constant.dart';
import 'package:traveles/feature/authentaction/business_logic/cubit/phone_auth_cubit.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/build_pin_code_phone_number.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/build_text_verify_phone_number.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/build_verify_otp_botton.dart';

class OtpScreen extends StatelessWidget {
    OtpScreen({
    super.key,
    required this.otpCode,
  });
  final String otpCode;
  
  @override
  Widget build(BuildContext context) {
     final String phoneNumber =
        ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      body: BlocListener<PhoneAuthCubit, PhoneAuthState>(
        listenWhen: (previous, current) {
          return previous != current;
        },
        listener: (context, state) {
          if (state is Loading) {
            showProgressIndicator(context);
          }
          if (state is OtpVerifiedSuccess) {
            Navigator.pop(context); // Close the progress indicator
            Navigator.pushReplacementNamed(
              context, ConstantRoutes.mapScreen,
              // arguments: phoneNumber
            );
          }
          if (state is PhoneAuthError) {
            Navigator.pop(context); // Close the progress indicator
            final String errorMessage = state.errorMessage;

            showSnackBar(context, message: errorMessage);
            // Navigator.pushNamed(context, ConstantRoutes.otp,
            //     arguments: phoneNumber
            // );
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 88),
          child: Column(
            children: [
              BuildTextVerifyPhoneNumber(
                phoneNumber: phoneNumber,
              ),
              SizedBox(
                height: 60,
              ),
              BuildPinCodePhoneNumber(
                otpCode: '',
              ),
              SizedBox(
                height: 30,
              ),
              BuildVerifyOtpBotton(
                otpCode: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
