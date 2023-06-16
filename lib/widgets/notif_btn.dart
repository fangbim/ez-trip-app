import 'package:flutter/material.dart';

class NotifBTN extends StatelessWidget {
  const NotifBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.pushNamed(context, '/notification');
      }),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(245, 245, 245, 0.3),
          border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.5), width: 2),
        ),
        child: Icon(
          Icons.notifications_none_sharp,
          color: Colors.black,
          size: 35,
        ),
      ),
    );
  }
}
