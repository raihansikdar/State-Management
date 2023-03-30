import 'dart:developer';

import 'package:base_client/controller/base_controller.dart';
import 'package:base_client/services/base_client.dart';

class TestController with BaseController {
  void getData() async {
    final response = await BaseClient()
        .get("https://jsonplaceholder.typicode.com", "/todos/1")
        .catchError(handleError);
    if (response == null) return;
    log(response.toString());
  }

  void postData() async {
    final request = {"name":"John", "age":30};
    final response = await BaseClient()
        .post("https://jsonplaceholder.typicode.com", "/posts",request)
        .catchError(handleError);
    if (response == null) return;
    log(response.toString());
  }
}
