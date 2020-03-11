import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

import './providers/auth.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/products_provider.dart';
import './screens/auth-screen.dart';
import './screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/edit_product_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AuthProvider(),
          ),
          ChangeNotifierProxyProvider<AuthProvider, Products>(
            create: (_) => Products(null, null, []),
            update: (ctx, authData, previusProducts) => Products(
                authData.token,
                authData.userId,
                previusProducts == null ? [] : previusProducts.items),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProxyProvider<AuthProvider, Orders>(
            create: (_) => Orders(null, null, []),
            update: (ctx, authData, previusOrders) => Orders(
                authData.token,
                authData.userId,
                previusOrders == null ? [] : previusOrders.orders),
          ),
        ],
        child: Consumer<AuthProvider>(
          builder: (ctx, authData, _) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: Colors.purple,
                  accentColor: Colors.deepOrange,
                  textTheme: TextTheme(
                    title: TextStyle(color: Colors.white),
                  )),
              home: authData.isAuth ? ProductOverviewScreen() : AuthScreen(),
              routes: {
                ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
                CartScreen.nameRoute: (ctx) => CartScreen(),
                OrdersScreen.routeName: (ctx) => OrdersScreen(),
                UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
                EditProductScreen.routeName: (ctx) => EditProductScreen(),
              },
            );
          },
        ));
  }
}
