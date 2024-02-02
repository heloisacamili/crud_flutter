import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:simple_crud/providers/product_provider.dart';

class CreateProviders extends ChangeNotifier {
  static final List<SingleChildWidget> list = [
    ChangeNotifierProvider(
      create: (context) => ProductProvider()
    )
  ];
}