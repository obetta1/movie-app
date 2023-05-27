import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/screens/screens.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({Key? key, required this.title, required this.spanText, required this.onPressed}) : super(key: key);
  final String title;
  final String spanText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(text: TextSpan(
          text:title,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 20,

          ),
          children:  [
            TextSpan(
                text: spanText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                recognizer: TapGestureRecognizer()..onTap=
                    ()=>onPressed()
            )
          ]
      ),
      ),
    );
  }
}
