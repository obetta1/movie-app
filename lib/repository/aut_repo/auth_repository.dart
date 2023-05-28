import 'package:firebase_auth/firebase_auth.dart'  as auth;
import 'package:get/get.dart';
import 'package:movi_app/repository/aut_repo/baseAuth_repository.dart';

import '../../screens/screens.dart';
import '../../utils/ui_helper.dart';



class AuthRepository extends BaseAuthRepository{
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;


  @override
  Future<auth.User?> signUp({required String email, required String password}) async{
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      user!.sendEmailVerification();
      showSnackbar('registered successful', 'verification link has been sent to your email, Verify your account and login to enjoy an amazing offer');
      Get.to( LoginScreen());
      return user;
    } catch (e) {
      print('signup error$e');
      showSnackbar('signUp failed', '${e}');
    }
  }

  @override
  Stream<auth.User?>? get users => throw UnimplementedError();
  @override
  Future<auth.User?> loginWithEmailAndPassword({required String email, required String password}) async{
    try {
      final user= await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to( HomeScreen());
      showSnackbar('login Successful', 'welcome to Eveword');
      return user.user;
    } catch (e) {
      showSnackbar('login failed', '${e}');
    }
  }

  @override
  Future<void> logout() async{
    try {
      await _firebaseAuth.signOut();
      showSnackbar('logout', 'you logged out ');
    } catch (e) {
      print('logout error');
    }
  }



}