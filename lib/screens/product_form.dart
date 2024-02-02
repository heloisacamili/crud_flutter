import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/components/appbar/appbar_component.dart';
import 'package:simple_crud/providers/product_provider.dart';
import 'package:simple_crud/validator/validator.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => ProductFormState();
}

class ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};

  _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    _formKey.currentState!.save();
    try{
      Provider.of<ProductProvider>(context, listen: false).addProduct(_formData, context);
    } catch(error){
      log(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        title: 'Cadastrar produto',
        icon: Icons.check,
        onPressed: () async {
          await _submit();
        } 
      ),
      body: ListView(
        children: [
          Form(
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
        ],
      ),
    );
  }
}