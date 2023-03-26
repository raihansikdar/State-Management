import 'package:get/get.dart';
import 'package:getx/models/product.dart';

class ShoppingController extends GetxController {
  // final products = <Product>[].obs;
  RxList<Product> products = RxList();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    dynamic productResult = [
      Product(
        id: 1,
        price: 30,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'firstProd',
      ),
      Product(
        id: 2,
        price: 40,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'secondProd',
      ),
      Product(
        id: 3,
        price: 50,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'threeProd',
      ),
       Product(
        id: 4,
        price: 60,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'fourProd',
      ),
        Product(
        id: 5,
        price: 70,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'fiveProd',
      ),
        Product(
        id: 6,
        price: 80,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'sixProd',
      ),
    ];

    products.addAll(productResult);
  }
}
