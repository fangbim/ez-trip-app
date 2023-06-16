import 'package:ez_trip_app/widgets/time_picker.dart';
import 'package:flutter/material.dart';

class CardPlan extends StatelessWidget {

  final String nama;
  final String imageURL;
  final String lokasi;


  const CardPlan({super.key, required this.nama, required this.imageURL, required this.lokasi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
      child: Row(children: [
        Column(children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: Color.fromRGBO(33, 70, 199, 1),
                shape: BoxShape.circle,
                border: Border.all(
                    color: Color.fromRGBO(217, 217, 217, 1), width: 4)),
          ),
          Container(
            width: 5,
            height: 50,
            decoration: BoxDecoration(color: Color.fromRGBO(217, 217, 217, 1)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TimePicker()
          ),
          Container(
            width: 5,
            height: 50,
            decoration: BoxDecoration(color: Color.fromRGBO(217, 217, 217, 1)),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: Color.fromRGBO(33, 70, 199, 1),
                shape: BoxShape.circle,
                border: Border.all(
                    color: Color.fromRGBO(217, 217, 217, 1), width: 4)),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Container(
            width: 264,
            height: 120,
            decoration: BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Container(
                    height: 120,
                    width: 120,
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          lokasi,
                          style: TextStyle(fontSize: 10), overflow: TextOverflow.clip,
                        )
                      ],
                    ),
                  )
                ]),
          ),
        )
      ]),
    );
  }
}
