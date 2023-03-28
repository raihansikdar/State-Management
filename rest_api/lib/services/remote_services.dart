import 'package:http/http.dart' as http;
import 'package:rest_api/models/product.dart';

class RemoteServices {
  static final client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    final response = await client.get(
      Uri.parse(
          "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"),
    );

    if (response.statusCode == 200) {
      final jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //return null;
      throw Exception("Failed to load products");
    }
  }
}
