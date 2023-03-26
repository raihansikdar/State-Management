import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: controller.obx(
          (state) => const Text(
            "HomeView is working",
            style: TextStyle(fontSize: 20),
          ),
          onLoading: LinearProgressIndicator(),
        ),
      ),
    );
  }
}
