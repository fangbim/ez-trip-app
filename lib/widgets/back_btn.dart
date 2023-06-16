import 'package:flutter/material.dart';

class BackBTN extends StatelessWidget {

  final String nav;

  const BackBTN({super.key, required this.nav});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Navigator.pushNamed(context, nav)),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(245, 245, 245, 0.3),
          border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.5), width: 2),
        ),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
          size: 35,
        ),
      ),
    );
  }
}
