import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/components/snackbar/snackbar_error.dart';
import 'package:simple_crud/components/snackbar/snackbar_success_cart.dart';
import 'package:simple_crud/model/product.dart';
import 'package:simple_crud/providers/product_provider.dart';
import 'package:simple_crud/screens/product_details.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({super.key, this.product});

  final Product? product;

  @override
  State<CardProduct> createState() => CardProductState();
}

class CardProductState extends State<CardProduct> {

  _addCart() {
    try {
      Provider.of<ProductProvider>(context, listen: false).addCart(widget.product!);
      SnackbarSuccessCart.showSnackbar(context);
    } catch (exception) {
      log(exception.toString());
      SnackbarError.showSnackbar(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: widget.product!,
            )
          )
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 3,
        child: Container(
          width: width * 0.5,
          height: height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        fit: BoxFit.cover,
                        widget.product?.url ?? '',
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 30,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Erro ao carregar imagem',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.product?.name ?? 'Nome',
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const  EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () => _addCart(), 
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'R\$ ${widget.product?.price.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}