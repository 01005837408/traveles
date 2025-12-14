import 'package:flutter/material.dart';

class BuildTextVerifyPhoneNumber extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BuildTextVerifyPhoneNumber({super.key});
   final String phoneNumber = " ";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Verify your phone number",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 88,
        ),
        RichText(
          text: TextSpan(
            text: "Enter you 6 digit code number sent to",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: phoneNumber,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
