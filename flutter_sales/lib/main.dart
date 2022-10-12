import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:flutter_sales/pages/avis_page.dart';
import 'package:flutter_sales/pages/cart_page.dart';
import 'package:flutter_sales/pages/list_product_page.dart';
import 'package:flutter_sales/pages/detail_page.dart';
import 'package:flutter_sales/model/product_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider<CartModel>(
      create: (_) => CartModel([]), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(initialLocation: "/list", routes: <GoRoute>[
    GoRoute(path: '/list', builder: (_, state) => const ListProductPage(),
        // builder: (_, state) => const ProductCheckPage(),
        routes: <GoRoute>[
          GoRoute(path: 'cart', builder: (_, state) => const CartPage()),
          GoRoute(
              path: 'detail',
              builder: (_, state) => DetailProductPage(state.extra as Product),
              routes: <GoRoute>[
                GoRoute(
                    path: 'avis',
                    builder: (_, state) => ListAvisPage(state.extra as Product))
              ])
        ]),
    GoRoute(path: '/home', builder: (_, state) => const HomePage())
  ]);
}
