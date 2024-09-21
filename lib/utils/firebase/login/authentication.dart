import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireBaseUtil {
  static final FireBaseUtil _singleton = FireBaseUtil._internal();

  factory FireBaseUtil() {
    return _singleton;
  }

  FireBaseUtil._internal();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> createUserByEmailAndPw({required String email, required String password}) async {
    bool result = false;
    try {
      UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(email: email, password: password);
      result = true;
      print('success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<bool> signInByEmailAndPw({
    required String email,
    required String password,
  }) async {
    bool result = false;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      result = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (_) {}
    return result;
  }

  Future<void> deleteCurrentAccount() async {
    try {
      await auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('The user must reauthenticate before this operation can be executed.');
      }
    }
  }
}
