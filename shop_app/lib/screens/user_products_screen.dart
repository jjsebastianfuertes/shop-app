import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../screens/edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product-item';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    // final scaffold = Scaffold.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your products"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                try {
                  await Navigator.of(context)
                      .pushNamed(EditProductScreen.routeName);
                } catch (error) {
                  Scaffold(
                    body: Builder(
                      builder: (context) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Deleting failed'),
                          ),
                        );
                      },
                    ),
                  );
                }
              })
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) =>
         RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child: Consumer<Products>(
                      builder: (ctx, productData, child) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: productsData.items.length,
                          itemBuilder: (ctx, i) => Column(
                            children: <Widget>[
                              UserProductItem(
                                id: productsData.items[i].id,
                                title: productsData.items[i].title,
                                imageUrl: productsData.items[i].imageUrl,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
