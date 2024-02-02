import 'package:flutter/material.dart';

class SnackbarError {
  static showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 30,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        content: Text('Algo de errado ocorreu!')
      )
    );
  }
}