import 'package:get/state_manager.dart';
import 'package:rest_api/models/product.dart';
import 'package:rest_api/services/remote_services.dart';

class ProductController extends GetxController {
  // final product = <Product>[].obs;
  var isLoading = true.obs;
  RxList<Product> productList = RxList();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
