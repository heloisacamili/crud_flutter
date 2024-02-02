import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/components/appbar/appbar_component.dart';
import 'package:simple_crud/components/card/card_product.dart';
import 'package:simple_crud/providers/product_provider.dart';
import 'package:simple_crud/routes/app_routes.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppbarComponent(
        title: 'Lista de produtos',
        icon: Icons.add,
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_FORM
          );
        },
        icon2: Icons.shopping_cart_outlined,
        onPressed2: () {
          Navigator.of(context).pushNamed(
            AppRoutes.CART
          );
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: provider.products.isEmpty
        ? const Center(
          child: Text(
            'Nenhum produto na lista.'
          ),
        )
        : GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisExtent: 280,
          ), 
          itemCount: provider.products.length,
          itemBuilder: (context, index) => CardProduct(
            product: provider.products[index],
          ),
        ),
      ),
    );
  }
}