import 'package:get/get.dart';

import 'package:getx/models/product.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = RxList();
  int get cartCount => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  // var testAmount = 0.0;

  addToCart(Product product) {
    cartItems.add(product);
    // testAmount = totalPrice;
    // update();
  }
}
