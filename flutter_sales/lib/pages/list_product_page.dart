import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import '../model/product_model.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class ListProductPage extends StatelessWidget {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('E-Commerce')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Go to home',
            onPressed: () => GoRouter.of(context).go('/home'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () => GoRouter.of(context).go('/list/cart'),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<http.Response>(
            future: http.get(Uri.parse("https://fakestoreapi.com/products/")),
            builder: (_, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                String body = snapshot.data!.body;
                List<Product> lsProducts = (jsonDecode(body) as List)
                    .map((e) => Product.fromJson(e))
                    .toList();
                return ListProductView(lsProducts: lsProducts);
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

class ListProductView extends StatelessWidget {
  const ListProductView({
    Key? key,
    required this.lsProducts,
  }) : super(key: key);

  final List<Product> lsProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: lsProducts.length,
      itemBuilder: (BuildContext context, int index) {
        final Product product = lsProducts[index];
        return Card(
            child: ListTile(
          onTap: () => GoRouter.of(context).go('/list/detail', extra: product),
          leading: Hero(
            tag: product.id,
            child: Image.network(
              lsProducts[index].image,
              width: 80,
              height: 80,
            ),
          ),
          title: Text(product.title),
          subtitle: Text(
            '${product.price} €',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () =>
                      context.read<CartModel>().addProduct(product),
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
