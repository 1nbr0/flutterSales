import 'package:flutter/material.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:go_router/go_router.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;
  const DetailProductPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(product.title)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: product.id,
                child: Image.network(product.image, width: 200, height: 200,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }),
              ),
              Text(
                product.title,
              ),
              Card(
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description",
                          style: Theme.of(context).textTheme.headline6),
                      Text(product.description),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.go('/list/detail/avis', extra: product),
                child: Card(
                  margin: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Avis",
                            style: Theme.of(context).textTheme.headline6),
                        Text(product.description),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Caractéristiques",
                          style: Theme.of(context).textTheme.headline6),
                      Text(product.description),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
