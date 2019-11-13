import 'package:flutter/material.dart';
import './screen/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
