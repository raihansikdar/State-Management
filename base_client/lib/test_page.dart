import 'dart:developer';

import 'package:base_client/services/base_client.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final response = await BaseClient().get("https://jsonplaceholder.typicode.com", "/todos/1");
            log(response);
          },
          
          child: const Text("Test"),
        ),
      ),
    );
  }
}
