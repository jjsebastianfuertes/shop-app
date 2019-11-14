import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/products_overview_screen.dart';
import './screen/product_detail_screen.dart';
import './providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.purple,
            fontFamily: 'Jomolhari'),
        home: ProductsOverviewScreen(),
        routes: {ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()},
      ),
    );
  }
}
