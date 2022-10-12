import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home")),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const <Widget>[
                    Text("Nos Produits seront ajoutés ici par la suite")
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.go('/list'),
            child: Row(
              children: const <Widget>[
                Text("Voir tout"),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
