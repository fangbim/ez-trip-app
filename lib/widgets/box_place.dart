
import 'package:ez_trip_app/providers/all_wisata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/plan.dart';

class BoxPlace extends StatelessWidget {
  final String id;
  final String imageURL;
  final String tittle;
  final String location;
  final String rating;

  const BoxPlace(
      {super.key,
      required this.id,
      required this.imageURL,
      required this.tittle,
      required this.location,
      required this.rating,
    });

  @override
  Widget build(BuildContext context) {

    final wisataId = ModalRoute.of(context)?.settings.arguments as String?;
    final wisata = Provider.of<AllWisata>(context).findById(wisataId);
    final plan = Provider.of<Plan>(context, listen: false);
    
    return InkWell(
      onTap: () => {Navigator.pushNamed(context, '/destinfo', arguments: id)},
      child: Container(
        width: 202,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Container(
              height: 197,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child:  Container(height: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            size: 10,
                          ),
                          Container(
                            width: 160,
                            child: Padding(
                              padding:const EdgeInsets.only(left: 3),
                              child: Text(
                                location,
                                style: const TextStyle(fontSize: 8),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                rating,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Berhasil ditambahkan'),
                            duration: Duration(milliseconds: 500),
                          )),
    
                          plan.addPlan(wisata!.id, wisata.imageURL, wisata.title, wisata.location)
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(97, 123, 213, 1),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
