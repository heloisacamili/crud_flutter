import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/components/appbar/appbar_component.dart';
import 'package:simple_crud/model/product.dart';
import 'package:simple_crud/providers/product_provider.dart';
import 'package:simple_crud/validator/validator.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({super.key, required this.product});

  final Product product;

  @override
  State<ProductEdit> createState() => ProductEditState();
}

class ProductEditState extends State<ProductEdit> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};

  _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    _formKey.currentState!.save();
    try{
      Provider.of<ProductProvider>(context, listen: false).editProduct(
        _formData, widget.product.id, context
      );
      Navigator.pop(context);
    } catch(error){
      log(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        title: 'Editar produto',
        icon: Icons.check,
        onPressed: () => _submit()
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10, 
                  right: 10, 
                  top: 10, 
                  bottom: 5
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _formData['id'] = value,
                  initialValue: widget.product.id,
                  validator: (value) => RequiredField.requiredFieldNumber(value),
                  maxLength: 6,
                  decoration: const InputDecoration(
                    labelText: 'Código do produto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10, 
                  right: 10, 
                  bottom: 25
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (value) => _formData['name'] = value,
                  initialValue: widget.product.name,
                  validator: (value) => RequiredField.requiredField(value),
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _formData['price'] = value,
                  initialValue: widget.product.price.toStringAsFixed(2),
                  validator: (value) => RequiredField.requiredField(value),
                  decoration: const InputDecoration(
                    labelText: 'Preço do produto',
                    hintText: 'R\$',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10, 
                  right: 10, 
                  bottom: 10, 
                  top: 25
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (value) => _formData['url'] = value,
                  initialValue: widget.product.url,
                  validator: (value) => RequiredField.requiredField(value),
                  decoration: const InputDecoration(
                    labelText: 'Url da imagem',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    )
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}