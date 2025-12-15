import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveles/core/function.dart';
import 'package:traveles/feature/authentaction/business_logic/cubit/phone_auth_cubit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(120, 50),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          ),
          onPressed: () {
            // BlocProvider.of<PhoneAuthCubit>(context).verifyOtp(otp);
            showProgressIndicator(context);
            BlocProvider.of<PhoneAuthCubit>(context).logOut();
          },
          child: Text(
            "Log Out",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}