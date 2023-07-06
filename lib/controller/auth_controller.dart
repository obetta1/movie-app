import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movi_app/repository/aut_repo/auth_repository.dart';

import '../screens/screens.dart';

class AuthController extends GetxController {
  //Auth Controller instance
  static AuthController instance = Get.find();
  //user model
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  AuthRepository authRepository = AuthRepository();
  // MovieRepository movieRepository = MovieRepository();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //this help to notify the user instance
    _user.bindStream(auth.userChanges());
    // a listener that help monitor the use changes

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    Timer(Duration(seconds: 3), () {
      if (user == null) {
        Get.to(HomeScreen());
      } else {
        Get.to(HomeScreen());
      }
    });
  }

  void login(String email, password) async {
    authRepository.loginWithEmailAndPassword(email: email, password: password);
  }

  void registerUser(String email, password) {
    authRepository.signUp(email: email, password: password);
  }

  void logoutUser() {
    authRepository.logout();
  }
}
