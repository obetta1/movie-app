
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/utils/ui_helper.dart';



class Validate{
  static bool validatePassword(String password,){
    if( password.isEmpty || password.length < 6){
      showSnackbar('Invalid password', "password must be more that 6 character");
      return false;
    } else{
      return true;
    };
  }

  static bool validateEmail(String email,){
    if( email.isNotEmpty && email.isEmail){
      return true;
    } else{
      showSnackbar('Invalid password', "password must be more that 6 character");
      return false;
    };
  }
}
