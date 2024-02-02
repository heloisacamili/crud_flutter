import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:simple_crud/components/snackbar/snackbar_error.dart';
import 'package:simple_crud/components/snackbar/snackbar_success.dart';
import 'package:simple_crud/model/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '102541', 
      name: 'Camisa Cartoon', 
      price: 100.00, 
      url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTERDwtW3KOHxRu0j14SkRfjMJDmdU2TJEjlw&usqp=CAU'
    ),
    Product(
      id: '102119', 
      name: 'Camiseta Handebol Brasil', 
      price: 149.90, 
      url: 'https://memoriasdoesporteoficial.com.br/wp-content/uploads/2022/03/WhatsApp-Image-2022-03-10-at-17.12.55-2.jpeg'
    ),
  ];
  List<Product> get products => _products;
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  Future<void> addProduct(Map<String, dynamic> data, BuildContext context) async {
    try{
      final product = Product(
        id: data['id'],
        name: data['name'],
        price: double.parse(data['price']),
        url: data['url']
      );
      _products.add(product);
      SnackbarSuccess.showSnackbar(context);
      Navigator.pop(context);
      notifyListeners();
    } catch(_){
      SnackbarError.showSnackbar(context);
      Navigator.pop(context);
      log(_.toString());
    }
  }

  Future<void> editProduct(Map<String, dynamic> data, String id, BuildContext context) async {
    try{
      int index = _products.indexWhere((element) => element.id == id);
      _products[index].id = data['id'];
      _products[index].name = data['name'];
      _products[index].price = double.parse(data['price']);
      _products[index].url = data['url'];
      notifyListeners();
      Navigator.pop(context);
      SnackbarSuccess.showSnackbar(context);
    } catch(_){
      SnackbarError.showSnackbar(context);
      log(_.toString());
    }
  }

  Future<void> removeProduct(Product product, BuildContext context) async {
    try{
      _products.remove(product);
      SnackbarSuccess.showSnackbar(context);
      notifyListeners();
    } catch (_) {
      SnackbarError.showSnackbar(context);
    }
  }

  void addCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clear() {
    _cart.clear();
    notifyListeners();
  }

  double get cartTotalPrice {
   double total = 0;
    for (var element in cart) {
      total += element.price;
    }
    return total;
  }
}