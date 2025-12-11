import 'package:flutter/material.dart';
import 'package:traveles/feature/presentation/widgets/build_text_phone_number.dart';
import 'package:traveles/feature/presentation/widgets/create_flage_and_text_form_field.dart';
import 'package:traveles/feature/presentation/widgets/create_next_botton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTextPhoneNumber(),
            
            CreateFlageAndTextFormField(),
            SizedBox(height: 40,),
            CreateNextBotton(),
          ],
        ),
      ),
    );
  }
}
