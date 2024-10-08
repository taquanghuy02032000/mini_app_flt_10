import 'dart:ui';

import 'package:get/get.dart';
import 'package:mini_app/model/thing_bought_model.dart';
import 'package:mini_app/utils/firebase/storage/firebase_storage.dart';

class ThingsBoughtController extends GetxController {
  FireBaseStorageUtil firebaseStorage = FireBaseStorageUtil();
  List<ThingBoughtModel> thingsBought = <ThingBoughtModel>[].obs;

  RxBool isLoading = false.obs;
  RxString errorToast = ''.obs;
  RxString successToast = ''.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    await getThingsBought();
  }

  Future<void> addBoughtThing({
    required String nameThing,
    required String money,
  }) async {
    isLoading.value = true;
    bool resultAdd = await firebaseStorage.addThingsBought(nameThing: nameThing, money: money);
    if (resultAdd) {
      print('successAdd');
    } else {
      print('errorAdd');
    }
    isLoading.value = false;
  }

  Future<void> getThingsBought() async {
    isLoading.value = true;
    List<ThingBoughtModel> result = await firebaseStorage.getThingsBoughtFromDB();
    thingsBought.clear();
    thingsBought.addAll(result);
    isLoading.value = false;
  }

  Future<void> deleteThingBought({required String id}) async {
    isLoading.value = true;
    bool result = await firebaseStorage.deleteThingBought(id: id);
    isLoading.value = false;
    if (!result) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Error',
          message: 'error when delete',
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Success',
          message: 'delete success',
          duration: Duration(seconds: 1),
        ),
      );

      // successToast.value = 'delete success';
    }
    await getThingsBought();
  }

  Future<void> updateThingBought({
    required String id,
    required String title,
    required String cost,
  }) async {
    isLoading.value = true;
    bool result = await firebaseStorage.editThingBought(
      id: id,
      title: title,
      cost: cost,
    );
    isLoading.value = false;
    if (!result) {
      // errorToast.value = 'error when update';
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Error',
          message: 'error when update',
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Success',
          message: 'update success',
          duration: Duration(seconds: 1),
        ),
      );
      // successToast.value = 'update success';
    }
    await getThingsBought();
  }

  ///For language
  final List<Map<String, dynamic>> localizations = [
    {
      'name': 'EngLish',
      'local': const Locale('en', 'US'),
    },
    {
      'name': 'VietNam',
      'local': const Locale('vi', 'VI'),
    }
  ];

  ///End language
}
