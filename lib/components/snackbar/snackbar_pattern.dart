import 'package:flutter/material.dart';

class SnackbarPattern {
  static showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 30,
        duration: Duration(seconds: 2),
        content: Text('Carrinho limpo!')
      )
    );
  }
}