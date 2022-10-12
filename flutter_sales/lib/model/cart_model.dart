import 'package:flutter/foundation.dart';

import 'product_model.dart';

class CartModel extends ChangeNotifier {
  final List<Product> lsProducts;

  CartModel(this.lsProducts);

  addProduct(Product product) {
    lsProducts.add(product);
    notifyListeners();
  }

  removeProduct(Product product) {
    lsProducts.remove(product);
    notifyListeners();
  }

  removeAllProducts() {
    lsProducts.clear();
    notifyListeners();
  }

  num getPriceCart() {
    return lsProducts.fold<num>(
        0, (previousValue, element) => previousValue + element.price);
  }
}
