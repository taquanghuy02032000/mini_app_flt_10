import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mini_app/model/thing_bought_model.dart';
import 'package:uuid/uuid.dart';

///Start Note
///Collections: same Table
///
///	Documents: like props
///End

class FireBaseStorageUtil {
  static final FireBaseStorageUtil _singleton = FireBaseStorageUtil._internal();

  factory FireBaseStorageUtil() {
    return _singleton;
  }

  FireBaseStorageUtil._internal();

  final storage = FirebaseFirestore.instance;

  // final CollectionReference thingsBoughtCollection = FirebaseFirestore.instance.collection
  // ('ThingsBought');

  Future<bool> addThingsBought({
    required String nameThing,
    required String money,
  }) async {
    ///https://firebase.google.com/docs/storage/flutter/handle-errors?hl=vi

    bool result = false;
    try {
      ///Cách 1: để thêm
      // await storage.collection('ThingsBought').add(data)
      ///Cách 2: để thêm
      await storage.collection('ThingsBought').doc(const Uuid().v1()).set({
        'thingName': nameThing,
        'cost': money,
      });
      result = true;
    } on FirebaseException catch (e) {
      result = false;
      print("Failed with error '${e.code}': ${e.message}");
    }
    return result;
  }

  Future<List<ThingBoughtModel>> getThingsBoughtFromDB() async {
    final QuerySnapshot thingsBoughtResult = await storage.collection("ThingsBought").get();

    final List<ThingBoughtModel> result =
        thingsBoughtResult.docs.map((e) => ThingBoughtModel.fromDocument(e)).toList();
    print(result.length);
    return result;
  }

  Future<bool> deleteThingBought({
    required String id,
  }) async {
    bool result = false;
    try {
      await storage.collection('ThingsBought').doc(id).delete();
      result = true;
    } on FirebaseException catch (errorFirebase) {
      print('error when delete $errorFirebase');
    } catch (_) {
      print('error when delete $_');
    }
    return result;
  }

  Future<bool> editThingBought({
    required String id,
    required String title,
    required String cost,
  }) async {
    bool result = false;
    final ThingBoughtModel modelEdit = ThingBoughtModel(
      id,
      cost,
      title,
    );
    try {
      await storage.collection('ThingsBought').doc(id).update(modelEdit.toMap());
      result = true;
    } on FirebaseException catch (errorFirebase) {
      print('error when update $errorFirebase');
    } catch (_) {
      print('error when update $_');
    }
    return result;
  }
}

/// BTVN:
// 1:làm thêm button xoá -> firebasestore delete
// 2.Sửa bản ghi:
// Cụ thể: bấm vào chi tiết thingBought -> hiển thị một dialog có 2 textField điền fill sẵn giá trị cũ của nó -> nếu tôi edit text (1 trong 2 trường cost || title) -> firebasestore …update
//
// (1) và (2) : reload trang -> cập nhật lại dữ liệu mới nhất
