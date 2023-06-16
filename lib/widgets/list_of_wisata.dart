import 'dart:math';

import 'package:ez_trip_app/services/wisata_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/plan.dart';
import './box_place.dart';
import 'package:ez_trip_app/providers/all_wisata.dart';

class ListOfWisata extends StatefulWidget {
  const ListOfWisata({super.key});

  @override
  State<ListOfWisata> createState() => _ListOfWisata();
}

class _ListOfWisata extends State<ListOfWisata> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AllWisata>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {

    // return ListView.builder(
    //   itemCount: dataWisata.length,
    //   scrollDirection: Axis.horizontal,
    //   itemBuilder: (context, index) => BoxPlace(
    //     id: 'id_${index + 1}',
    //     imageURL: dataWisata[index].imageURL,
    //     tittle: dataWisata[index].title,
    //     location: dataWisata[index].location,
    //     rating: (1 + Random().nextInt(5).toDouble()).toString(),
    // ));

    return Consumer<AllWisata>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final data = value.allwisata;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final wisata = data[index];
            return Padding(
              padding: const EdgeInsets.only(right: 30),
              child: BoxPlace(
                  id: wisata.id,
                  imageURL: wisata.imageURL,
                  tittle: wisata.title,
                  location: wisata.location,
                  rating: (1 + Random().nextInt(5).toDouble()).toString()),
            );
          },
        );
      },
    );
  }
}
