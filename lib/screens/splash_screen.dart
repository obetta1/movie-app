
import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {


    return  Container(
      color: Colors.redAccent,
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Column(
            children:const [
               CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 200,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
