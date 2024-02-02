import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/components/snackbar/snackbar_error.dart';
import 'package:simple_crud/model/product.dart';
import 'package:simple_crud/providers/product_provider.dart';

class DeleteModal extends StatelessWidget {
  const DeleteModal({super.key, required this.name, required this.product});

  final String name;
  final Product product;


  @override
  Widget build(BuildContext context) {

    delete() {
      try {
        Provider.of<ProductProvider>(context, listen: false).removeProduct(product, context);
        Navigator.pop(context);
      } catch (exception) {
        SnackbarError.showSnackbar(context);
        log(exception.toString());
      }
    }
    return AlertDialog(
      content: Text(
        'Tem certeza que deseja excluir o produto $name?',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop, 
          child: const Text(
            'Cancelar'
          )
        ),
        TextButton(
          onPressed: () => delete(), 
          child: const Text(
            'Confirmar'
          )
        )
      ],
    );
  }
}