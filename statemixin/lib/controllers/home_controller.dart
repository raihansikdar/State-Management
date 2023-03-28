import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController with StateMixin<List<String>> {
  @override
  void onInit() {
    super.onInit();
    fetchComment();
  }

  fetchComment() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/raihansikdar/State-Management/main/comment.json'));
    if (response.statusCode == 200) {
      final jArray = json.decode(response.body);
      final comments = List<String>.from(jArray.map((s) => s));

      // No records
      if (comments.isEmpty) {
        change(null, status: RxStatus.empty());
      }
      else{
        // success
      change(comments, status: RxStatus.success());
      }
    } else {
      // Error
      change(null, status: RxStatus.error('errorCode: ${response.statusCode}'));
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
