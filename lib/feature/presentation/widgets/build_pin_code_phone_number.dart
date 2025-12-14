import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:traveles/core/constant/app_color.dart';

class BuildPinCodePhoneNumber extends StatelessWidget {
  const BuildPinCodePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: AppColor.blue,
        inactiveColor: Colors.blue,
        inactiveFillColor: Colors.white,
        activeFillColor: AppColor.lightBlue,
        selectedColor: Colors.blue,
        selectedFillColor: Colors.white,
        
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
    
      onCompleted: (code) {
        // otpCode = code;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      
      },
     
    );
  }
}
