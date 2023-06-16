import 'package:flutter/material.dart';

class ListDays extends StatelessWidget {

  final String day;
  final String date;

  const ListDays({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromRGBO(190, 190, 190, 1)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
    );
  }
}