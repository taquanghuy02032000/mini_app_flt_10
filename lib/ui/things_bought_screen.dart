import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mini_app/controller/things_bought_controller.dart';

class ThingsBoughtScreen extends StatefulWidget {
  const ThingsBoughtScreen({Key? key}) : super(key: key);

  @override
  State<ThingsBoughtScreen> createState() => _ThingsBoughtScreenState();
}

class _ThingsBoughtScreenState extends State<ThingsBoughtScreen> {
  late ThingsBoughtController _controller;
  late TextEditingController _costController;
  late TextEditingController _nameThingController;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(ThingsBoughtController());
    _costController = TextEditingController();
    _nameThingController = TextEditingController();
  }

  void openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Dialog'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _costController,
              decoration: const InputDecoration(hintText: 'Cost'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _nameThingController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Confirm"),
            onPressed: () => Get.back(
              result: [
                _costController.text,
                _nameThingController.text,
              ],
            ),
          ),
        ],
      ),
    ).then((result) async {
      _costController.clear();
      _nameThingController.clear();
      if (result != null) {
        // Xử lý kết quả ở đây
        String cost = result[0];
        String nameThing = result[1];

        // context.loaderOverlay.show();

        await _controller.addBoughtThing(
          nameThing: nameThing,
          money: cost,
        );
        // context.loaderOverlay.hide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ever(
      _controller.isLoading,
      (callback) => {
        if (callback) {context.loaderOverlay.show()} else {context.loaderOverlay.hide()}
      },
    );

    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          openDialog();
        },
        child: const Text('Add thing bought'),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Things Bought'),
      ),
      body: SafeArea(
        child: Obx(() {
          return ListView.builder(
            itemCount: _controller.thingsBought.length,
            itemBuilder: (context, index) {
              final thing = _controller.thingsBought[index];
              return boughtItem(
                name: thing.title ?? '',
                cost: thing.cost ?? '',
              );
            },
          );
        }),
      ),
    );
  }

  Widget boughtItem({
    required String name,
    required String cost,
  }) {
    return InkWell(
      onTap: () async {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/money.png',
              height: 50,
              width: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(name),
                Text(cost),
              ],
            )
          ],
        ),
      ),
    );
  }
}
