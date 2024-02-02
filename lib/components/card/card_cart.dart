import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/model/product.dart';
import 'package:simple_crud/providers/product_provider.dart';

class CardCart extends StatefulWidget {
  const CardCart({super.key, required this.product});

  final Product product;

  @override
  State<CardCart> createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {

  void remove() {
    try {
      Provider.of<ProductProvider>(context, listen: false).removeCart(widget.product);
    } catch (exception) {
      log(exception.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.product.url,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_search,
                  color: Colors.grey.shade300,
                );
              },
            ),
          ),
        ),
        title: Text(
          widget.product.name
        ),
        subtitle: Text(
          'R\$ ${widget.product.price.toStringAsFixed(2)}'
        ),
        trailing: IconButton(
          onPressed: () => remove(), 
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          )
        )
      ),
    );
  }
}