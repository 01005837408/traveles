import 'package:flutter/material.dart';
import 'package:traveles/core/constant/app_color.dart';

class CreateFlageAndTextFormField extends StatelessWidget {
  const CreateFlageAndTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          buildFlagCountry(),
          SizedBox(
            width: 16,
          ),
          buildTextFieldPhoneNumber(),
        ],
      ),
    );
  }

  Expanded buildTextFieldPhoneNumber() {
    return Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.blue),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }else if(value.length < 11){
                      return "The phone number must be at least 11 digits";
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                )));
  }

  Expanded buildFlagCountry() {
    return Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.lightgrey),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${generateCountryFlag()} +20",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Transform.rotate(
                    angle: -90 * 3.14 / 180,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ));
  }

  String generateCountryFlag() {
    String countryCode = "eg";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r"[A-Z]"),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}

/// for(int i=0;i<countryCode.length;i++){
    //   int charCode=countryCode.codeUnitAt(i)+127397;
    //   flag+=String.fromCharCode(charCode);
    // }