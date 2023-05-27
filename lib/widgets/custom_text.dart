
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);

 static Widget greyText(String text){
    return Text(text, style:const TextStyle(fontSize: 20, color: Colors.grey));
  }
  static Widget blackBodyText(String text){
    return Text(text, style:const TextStyle(fontSize: 20, color: Colors.black));
  }
  static Widget headLine(String text){
    return Text(text, style:const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold));
  }
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
