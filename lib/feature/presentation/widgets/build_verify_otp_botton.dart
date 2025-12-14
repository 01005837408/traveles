import 'package:flutter/material.dart';

class BuildVerifyOtpBotton extends StatelessWidget {
  const BuildVerifyOtpBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, ),
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
          onPressed: () {},
          child: Text(
            "Verify",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
