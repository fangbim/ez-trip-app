import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class FeatureBTN extends StatelessWidget {
  final Widget icon;
  final String title;

  const FeatureBTN({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 58,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3)
              ]),
          child: icon,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
