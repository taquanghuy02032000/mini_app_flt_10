import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:mini_app/model/thing_bought_model.dart';
import 'package:mini_app/utils/firebase/login/authentication.dart';
import 'package:mini_app/utils/firebase/storage/firebase_storage.dart';

class ThingsBoughtController extends GetxController {
  FireBaseStorageUtil firebaseStorage = FireBaseStorageUtil();
  List<ThingBoughtModel> thingsBought = <ThingBoughtModel>[].obs;

  RxBool isLoading = false.obs;

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
    thingsBought.addAll(result);
    isLoading.value = false;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    await getThingsBought();
  }
}
