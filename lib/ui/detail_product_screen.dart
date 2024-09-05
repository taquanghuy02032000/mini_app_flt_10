import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:mini_app/controller/detail_product_controller.dart';
import 'package:mini_app/model/detail_product_model.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  late DetailProductController _controller;

  @override
  void initState() {
    _controller = Get.put(DetailProductController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 65,
        // margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          onPressed: () {},
          child: const Center(
            child: Text('Liên hệ'),
          ),
        ),
      ),
      appBar: AppBar(
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
      body: Obx(() => _controller.isLoading.value == true
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Carousel Slider UI
                    Stack(
                      children: [
                        Container(
                            child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayAnimationDuration: const Duration(milliseconds: 5000),
                          ),
                          items: _controller.imageCarousel
                              .map((item) => Container(
                                    child: Center(
                                      child: Image.network(
                                        item,
                                        fit: BoxFit.fill,
                                        height: 300,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey,
                            ),
                            child: const Text('1/7'),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Màu sắc: ${_controller.titleColor}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Wrap(
                      children: _controller
                          .colorOptions()
                          .map((e) => GestureDetector(
                                onTap: () {
                                  _controller.changeColor(e ?? '');
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 16,
                                    bottom: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  child: Text(e ?? ''),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Dung lượng: ${_controller.titleSizeMemory}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Wrap(
                      children: _controller
                          .sizeMemory()
                          .map((e) => GestureDetector(
                                onTap: () {
                                  _controller.changeSize(e ?? '');
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 16,
                                    bottom: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.blueAccent),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  child: Text(e ?? ''),
                                ),
                              ))
                          .toList(),
                    ),

                    ///Name
                    Text(
                      _controller.detailProduct.value?.result?.product?.productInfo?.name ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${_controller.detailProduct.value?.result?.product?.prices?.first?.latestPrice}đ',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          '${_controller.detailProduct.value?.result?.product?.prices?.first?.supplierRetailPrice}đ   ',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '-${_controller.detailProduct.value?.result?.product?.prices?.first?.discountPercent}%',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _controller.getInfoTitleList
                          .map((e) => Container(
                                child: Text(e),
                                margin: const EdgeInsets.only(
                                  bottom: 10,
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      'Chi tiết sản phẩm',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.6),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 16,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _controller.attributes[index].name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  _controller.attributes[index].value ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: _controller.attributes.length,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Xem thêm nội dung'),
                        IconButton(
                          icon: const Icon(Icons.expand_more),
                          onPressed: () {},
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 6,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mô tả sản phẩm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    // Html(data: DetailProductController.testHtml),
                    Text(
                      '${_controller.detailProduct?.value?.result?.product?.productDetail?.description}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
