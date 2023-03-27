import 'package:http/http.dart' as http;
import 'package:rest_api/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
       throw Exception("Failed to load products");
    }
  }
}
