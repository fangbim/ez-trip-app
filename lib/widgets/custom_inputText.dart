import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final String hintText;
  final bool scured;
  TextEditingController? textController;

  CustomInputText({super.key,  required this.hintText, required this.scured, required this.textController});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
                    width: 249,
                    height: 46,
                    child: TextField(
                      style: const TextStyle(color: Colors.black, ),
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: const TextStyle(color: Colors.black, fontSize: 12),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        disabledBorder: InputBorder.none
                      ), obscureText: scured,
                      autocorrect: false, enableSuggestions: false,
                      controller: textController,            
                    ),
                  ),
    );
  }
  
}