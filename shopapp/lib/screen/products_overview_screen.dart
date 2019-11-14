import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHOP APP'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectValue) {
              if (selectValue == FilterOptions.Favorites) {
                //...
              } else {
                //...
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              )
            ],
          ),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
