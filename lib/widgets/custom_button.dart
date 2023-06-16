import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  VoidCallback onPressed;

  CustomButton({ required this.inputText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(33, 70, 199, 1),
            minimumSize: const Size(249, 46),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          inputText,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ));
  }
}
