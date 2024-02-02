import 'package:flutter/material.dart';
import 'package:simple_crud/model/product.dart';
import 'package:simple_crud/screens/product_edit.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
        trailing: SizedBox(
          width: 80,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => ProductEdit(product: product)
                    )
                  );
                }, 
                icon: const Icon(Icons.edit)
              ),
              IconButton(
                onPressed: () {
                }, 
                icon: const Icon(Icons.delete)
              )
            ],
          ),
        )
      ),
    );
  }
}