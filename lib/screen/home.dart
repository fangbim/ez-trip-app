import 'package:ez_trip_app/widgets/notif_btn.dart';
import 'package:ez_trip_app/widgets/place_category.dart';
import 'package:ez_trip_app/widgets/searching_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/list_of_wisata.dart';

class Home extends StatelessWidget {
  final String name = 'Kafil Anjani';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: Column(
                      children: [
                        Text(
                          'Current location',
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: Colors.black,
                            ),
                            Text(
                              'Gresik, East Java',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: NotifBTN(),
                  )
                ],
              ),
            ),
            Text(
              'Hi, $name',
              style: TextStyle(fontSize: 11),
            ),
            Text(
              'Where do you want to be?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SearchingBar(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: Row(
                children: [
                  PlaceCategory(text: 'All', boxWidth: 60),
                  PlaceCategory(text: 'Mountain', boxWidth: 114),
                  PlaceCategory(text: 'Religion', boxWidth: 89),
                  PlaceCategory(text: 'Festival', boxWidth: 89),
                  PlaceCategory(text: 'Beach', boxWidth: 89),
                  PlaceCategory(text: 'Museum', boxWidth: 89),
                ],
              ),
            ),
            
            Expanded(
              child: ListOfWisata(),
            )
          ],
        ),
      ),
    );
  }
}

