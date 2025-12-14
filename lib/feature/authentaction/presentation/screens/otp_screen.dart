import 'package:flutter/material.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/build_pin_code_phone_number.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/build_text_verify_phone_number.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/build_verify_otp_botton.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 88),
        child: Column(
          children: [
            BuildTextVerifyPhoneNumber(),
            SizedBox(
              height: 60,
            ),
            BuildPinCodePhoneNumber(),
            SizedBox(
              height: 30,
            ),
            BuildVerifyOtpBotton(),
          ],
        ),
      ),
    );
  }
}
