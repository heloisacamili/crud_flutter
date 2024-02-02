import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/components/appbar/appbar_component.dart';
import 'package:simple_crud/components/card/card_cart.dart';
import 'package:simple_crud/components/snackbar/snackbar_pattern.dart';
import 'package:simple_crud/providers/product_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  void clear() {
    try {
      Provider.of<ProductProvider>(context, listen: false).clear();
      SnackbarPattern.showSnackbar(context);
    } catch (exception) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: const AppbarComponent(
        title: 'Carrinho de compras',
      ),
      body: provider.cart.isEmpty
      ? const Center(
        child: Text(
          'Carrinho limpo!'
        ),
      )
      : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.cart.length,
              itemBuilder: (context, index) => CardCart(
                product: provider.cart[index]
              )
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                FilledButton(
                  onPressed: () => clear(),
                  child: const Text(
                    'Finalizar compra'
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Total: R\$ ${provider.cartTotalPrice}'
                  ),
                )
              ],
            )
          ),
        ],
      )
    );
  }
}