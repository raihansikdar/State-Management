import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController with StateMixin<List<String>> {
  @override
  void onInit() {
    fetchComment();
    super.onInit();
  }

  fetchComment() async {
    var response = await http
        .get(Uri.parse('https://afzalali15.github.io/api/comments.json'));
    if (response.statusCode == 200) {
      var jArray = json.decode(response.body);
      var comments = List<String>.from(jArray.map((s) => s));

      change(comments, status: RxStatus.success());
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
