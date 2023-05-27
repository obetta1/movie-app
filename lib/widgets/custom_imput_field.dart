
import 'package:flutter/material.dart';

class CustomInputfield extends StatelessWidget {
  const CustomInputfield({
    super.key,
     required this.label, this.icon, required this.controller,
  });

  final TextEditingController controller;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(1, 1),
                  blurRadius: 10,
                  spreadRadius: 7
              )
            ]
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            label:  Text(label),
            icon: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(icon),
            ),
            iconColor: Colors.orange[700],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const  BorderSide(
                  color: Colors.white
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.white
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}