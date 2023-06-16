import 'package:flutter/material.dart';

class PlaceCategory extends StatelessWidget {
  final String text;
  final double boxWidth;
  
  const PlaceCategory({required this.text, required this.boxWidth});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
                width: boxWidth,
                height: 44,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              ),
    );
  }

}