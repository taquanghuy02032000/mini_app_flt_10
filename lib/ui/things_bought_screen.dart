import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mini_app/config/theme/app_theme.dart';
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
  late TextEditingController _costControllerEdit;
  late TextEditingController _nameThingControllerEdit;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(ThingsBoughtController());
    _costController = TextEditingController();
    _nameThingController = TextEditingController();
    _costControllerEdit = TextEditingController();
    _nameThingControllerEdit = TextEditingController();
  }

  void changeLanguageApp() {
    Get.dialog(AlertDialog(
      title: Text(
        'selectLanguage'.tr,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      content: Container(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final currentLanguageValue = _controller.localizations[index]['name'];
            final currentLocaleValue = _controller.localizations[index]['local'];
            return InkWell(
              child: Text(currentLanguageValue),
              onTap: () {
                Get.back();
                Get.updateLocale(currentLocaleValue);
                // Get.updateLocale(Locale('vi', 'VI'));
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _controller.localizations.length,
        ),
      ),
    ));
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

        await _controller.addBoughtThing(
          nameThing: nameThing,
          money: cost,
        );
        await _controller.getThingsBought();
      }
    });
  }

  void openEditThing({
    required String id,
    required String cost,
    required String title,
  }) {
    _costControllerEdit.text = cost;
    _nameThingControllerEdit.text = title;
    Get.dialog(
      AlertDialog(
        title: const Text('Edit Thing Bought'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _costControllerEdit,
              decoration: const InputDecoration(hintText: 'Cost edit'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _nameThingControllerEdit,
              decoration: const InputDecoration(hintText: 'Title edit'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Confirm Edit"),
            onPressed: () => Get.back(
              result: [
                _costControllerEdit.text,
                _nameThingControllerEdit.text,
              ],
            ),
          ),
        ],
      ),
    ).then((result) async {
      if (result != null) {
        // Xử lý kết quả ở đây
        String cost = result[0];
        String nameThing = result[1];

        await _controller.updateThingBought(
          id: id,
          title: nameThing,
          cost: cost,
        );
        await _controller.getThingsBought();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    everAll(
      [_controller.isLoading, _controller.successToast, _controller.errorToast],
      (_) => {
        if (_controller.isLoading.value)
          {context.loaderOverlay.show()}
        else
          {context.loaderOverlay.hide()},
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
        title: Text('hello'.tr),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              child: Icon(Icons.language, size: 30),
              onTap: () {
                changeLanguageApp();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              child: Icon(Icons.color_lens_rounded, size: 30),
              onTap: () {
                Get.changeTheme(
                  Get.isDarkMode ? ThemesApp.light : ThemesApp.dark,
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          return ListView.builder(
            itemCount: _controller.thingsBought.length,
            itemBuilder: (context, index) {
              final thing = _controller.thingsBought[index];
              return boughtItem(
                id: thing.id ?? '',
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
    required String id,
    required String name,
    required String cost,
  }) {
    return Container(
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
          ),
          const Spacer(),
          InkWell(
            child: const Icon(Icons.edit),
            onTap: () {
              openEditThing(
                id: id,
                cost: cost,
                title: name,
              );
            },
          ),
          InkWell(
            onTap: () {
              _controller.deleteThingBought(id: id);
            },
            child: const Icon(
              Icons.clear,
            ),
          )
        ],
      ),
    );
  }
}
