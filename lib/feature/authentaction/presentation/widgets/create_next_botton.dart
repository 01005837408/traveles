import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveles/core/function.dart';
import 'package:traveles/core/routes/routes_constant.dart';
import 'package:traveles/feature/authentaction/business_logic/cubit/phone_auth_cubit.dart';

class CreateNextBotton extends StatelessWidget {
  CreateNextBotton({super.key, required this.phoneNumber});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Align(
          alignment: Alignment.centerRight,
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
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<PhoneAuthCubit>(context)
                    .submitPhoneNumber(phoneNumber);
                    showProgressIndicator(context);
                // If the form is valid, proceed to the next step
              } else {
                Navigator.pop(context);
              }
            },
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
