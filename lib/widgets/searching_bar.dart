import 'package:flutter/material.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // originsl width 310
      width: 368 ,
      height: 46,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.black54)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              // original width 250
              width: 290,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Find some place',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ),
          Icon(Icons.search)
        ],
      ),
    );
  }
}
