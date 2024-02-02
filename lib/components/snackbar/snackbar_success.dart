import 'package:flutter/material.dart';

class SnackbarSuccess {
  static showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 30,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        content: Text('Operação realizada com sucesso!')
      )
    );
  }
}