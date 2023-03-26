import 'package:get/get.dart';

class Product {
  final int? id;
  final String? productName;
  final String? productImage;
  final String? productDescription;
  final double price;

  Product({
    this.id,
    this.productName,
    this.productImage,
    this.productDescription,
    this.price = 0,
  });
  final isFavorite = false.obs;
}
