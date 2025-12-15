import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveles/core/function.dart';
import 'package:traveles/core/routes/routes_constant.dart';
import 'package:traveles/feature/authentaction/business_logic/cubit/phone_auth_cubit.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/build_text_phone_number.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/create_flage_and_text_form_field.dart';
import 'package:traveles/feature/authentaction/presentation/widgets/create_next_botton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<PhoneAuthCubit, PhoneAuthState>(
          listenWhen: (previous, current) {
            return previous != current;
          },
          listener: (context, state) {
            if (state is Loading) {
              showProgressIndicator(context);
            }
            if (state is PhoneNumberSubmittedSuccess) {
            //  Navigator.pop(context); // Close the progress indicator
              Navigator.pushNamed(context, ConstantRoutes.otp,
                  arguments: phoneNumber);
            }
            if (state is PhoneAuthError) {
              Navigator.pop(context); // Close the progress indicator
              final String errorMessage = state.errorMessage;
              
              showSnackBar(context, message: errorMessage); 
              Navigator.pushNamed(context, ConstantRoutes.otp,
                  arguments: phoneNumber);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTextPhoneNumber(),
              CreateFlageAndTextFormField(),
              SizedBox(
                height: 40,
              ),
              CreateNextBotton(
                phoneNumber: phoneNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
 
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
