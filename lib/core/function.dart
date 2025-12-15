import 'package:flutter/material.dart';
void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
  backgroundColor: Colors.transparent,
  elevation: 0,
  content: Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    ),
  ),
);

  showDialog(
    barrierDismissible: false,  // Prevents dismissal on outside touch
    barrierColor: Colors.white, // Semi-transparent white background 
    context: context,
    builder: (context) => alertDialog,
  );
}

 void showSnackBar(BuildContext context, {required String message}) {
    final snackBar = SnackBar(backgroundColor: Colors.black, content: Text(message, style:TextStyle(color: Colors.white) ,));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

