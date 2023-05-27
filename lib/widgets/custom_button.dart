import 'package:flutter/material.dart';




class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.wSize,
      required this.hSize,
      required this.onTap, required this.label});
  final double wSize;
  final double hSize;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => onTap,
        child: Container(
          alignment: Alignment.center,
          width: wSize * 0.5,
          height: hSize * 0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/loginbtn.png'))),
          child:  Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
