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
          (state) => ListView.builder(
            itemCount: state?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(radius: 24),
                title: Text(state?[index] ?? ''),
              );
            },
          ),
          onLoading: const LinearProgressIndicator(),
          onEmpty: const Text("All caught up!"),
          //onError: (error) => const Text("Something went worng!"),
          onError: (error) => Text(error ?? ''),
        ),
      ),
    );
  }
}
