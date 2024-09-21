import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mini_app/controller/list_product_controller.dart';
import 'package:mini_app/model/products_response.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({Key? key}) : super(key: key);

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  late ListProductController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ListProductController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle settings button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              // Handle info button press
            },
          ),
        ],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.loadingAll.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final List<ProductModel> products = controller.products;
            return NotificationListener<ScrollNotification>(
              onNotification: (scroll) {
                if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
                  if (scroll is ScrollEndNotification) {
                    controller.loadMore();
                  }

                  // print('LogLoadMore');

                  // print('here');
                }
                return true;
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return itemProduct(products[index].title ?? '');
                      },
                    ),
                  ),
                  Obx(() {
                    if (controller.loadingList.value) {
                      return const CircularProgressIndicator();
                    } else {
                      return const SizedBox();
                    }
                  })
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Widget itemProduct(
    String title,
  ) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Text(title),
    );
  }
}
