import 'package:get/get.dart';
import 'package:mini_app/utils/firebase/login/authentication.dart';

class LoginController extends GetxController {
  void login({
    required String email,
    required String password,
  }) async {
    FireBaseUtil fireBaseUtil = FireBaseUtil();
    bool result = await fireBaseUtil.createUserByEmailAndPw(email: email, password: password);
    if (result) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Success :))',
        ),
      );
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Error :((',
        ),
      );
    }
  }
}
