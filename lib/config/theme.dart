import 'package:flutter/material.dart';

ThemeData themeData(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme()
  );
}

TextTheme textTheme(){
  return const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 70,
      fontWeight: FontWeight.bold
    ),
      displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
      headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.normal
      ),
      headlineMedium: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.normal
      ),
      headlineSmall: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold
      ),
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold
      )

 );
}