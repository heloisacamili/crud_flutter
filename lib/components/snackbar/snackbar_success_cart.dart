import 'package:flutter/material.dart';

class SnackbarSuccessCart {
  static showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 30,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
        content: Text('Produto adicionado ao carrinho com sucesso!')
      )
    );
  }
}