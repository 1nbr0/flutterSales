import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Panier Flutter Sales')),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                context.watch<CartModel>().lsProducts.isEmpty
                    ? Text("Votre panier est actuellement vide",
                        style: Theme.of(context).textTheme.headline6)
                    : Text(
                        "Votre panier contient "
                        "${context.read<CartModel>().lsProducts.length}"
                        " éléments",
                        style: Theme.of(context).textTheme.headline6),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete),
                  tooltip: 'Supprimer tout le pannier',
                  onPressed: () =>
                      context.read<CartModel>().removeAllProducts(),
                ),
              ],
            ),
          ),
          Consumer<CartModel>(
              builder: (_, cart, __) => Expanded(
                      child: ListView.builder(
                    itemCount: cart.lsProducts.length,
                    itemBuilder: (_, index) => Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          cart.lsProducts[index].image,
                          width: 80,
                          height: 80,
                        ),
                        title: Text(cart.lsProducts[index].title),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Supprimer tout le pannier',
                          onPressed: () => context
                              .read<CartModel>()
                              .removeProduct(cart.lsProducts[index]),
                        ),
                      ),
                    ),
                  ))),
          Row(
            children: [
              Text(
                  "Le solde de votre panier est : ${context.watch<CartModel>().getPriceCart()}",
                  style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ],
      ),
    );
  }
}
