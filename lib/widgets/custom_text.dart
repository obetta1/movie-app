
import 'package:flutter/material.dart';

class CustomText {
  static Widget whiteText(String text){
    return Text(text, style:const TextStyle(fontSize: 20, color: Colors.white));
  }
 static Widget greyText(String text){
    return Text(text, style:const TextStyle(fontSize: 20, color: Colors.grey));
  }
  static Widget blackBodyText(String text){
    return Text(text, style:const TextStyle(fontSize: 20, color: Colors.black));
  }
  static Widget headLine(String text){
    return Text(text, style:const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold));
  }
}
