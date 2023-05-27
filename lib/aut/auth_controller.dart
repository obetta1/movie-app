import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  //Auth Controller instance
  static AuthController instance = Get.find();
  //user model
  late Rx<User?> _user;


  void login(String email, password) async{}
}
