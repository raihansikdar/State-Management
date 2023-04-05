import 'package:base_client/controller/test_controller.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final controller = TestController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Page"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [ 
            ElevatedButton(
              onPressed: () async {
                controller.getData();
              },
              child: const Text('GET Data', style: TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 10,),
             ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: const Text('POST Data', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
        
      ),
    );
  }
}
