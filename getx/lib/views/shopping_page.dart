import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                child: const Text('Add to Cart'),
                              ),
                              Obx(() => IconButton(
                                    onPressed: () {
                                      controller.products[index].isFavorite
                                          .toggle();
                                    },
                                    icon: controller
                                            .products[index].isFavorite.value
                                        ? const Icon(Icons.check_box_rounded)
                                        : const Icon(Icons
                                            .check_box_outline_blank_outlined),
                                  )),
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),

            // GetBuilder<CartController>(
            //   builder: (controller){
            //     return Text('Total amount: \$ ${controller.totalPrice}',
            //     style: const TextStyle(fontSize: 32,color: Colors.white),
            //      );
            //   },
            // ),
            //  GetX<CartController>(
            //    builder: (controller) {
            //      return Text('Total amount: \$ ${controller.totalPrice}',
            //      style: const TextStyle(fontSize: 32,color: Colors.white),
            //      );
            //    }
            //  ),

            Obx(() {
              return Text(
                'Total amount: \$ ${cartController.totalPrice}',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: const Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.cartCount.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 25),
          );
        }),
      ),
    );
  }
}
