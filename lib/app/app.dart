import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/providers/product_provider.dart';
import 'package:simple_crud/routes/app_routes.dart';
import 'package:simple_crud/screens/cart.dart';
import 'package:simple_crud/screens/product_form.dart';
import 'package:simple_crud/screens/product_list.dart';
import 'package:simple_crud/screens/settings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider()
        )
      ],
      child: MaterialApp(
        title: 'Simple CRUD',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME :(context) => const ProductList(),
          AppRoutes.PRODUCT_FORM : (context) => const ProductForm(),
          AppRoutes.SETTINGS : (context) => const SettingsScreen(),
          AppRoutes.CART : (context) => const CartScreen(),
        },
        theme: ThemeData(
          brightness: Brightness.light,
        ),
      ),
    );
  }
}