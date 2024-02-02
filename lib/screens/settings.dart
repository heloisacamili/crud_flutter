import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/components/appbar/appbar_component.dart';
import 'package:simple_crud/components/card/settings_card.dart';
import 'package:simple_crud/providers/product_provider.dart';
import 'package:simple_crud/routes/app_routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context).products;
    
    return Scaffold(
      appBar: AppbarComponent(
        title: 'Gerenciar',
        icon: Icons.add,
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_FORM
          );
        },
      ),
      body: ListView.builder(
        itemCount: provider.length,
        itemBuilder: (context, index) => SettingsCard(
          product: provider[index],
        ),
      )
    );
  }
}