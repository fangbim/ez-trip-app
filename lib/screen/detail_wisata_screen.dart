import 'package:ez_trip_app/providers/all_wisata.dart';
import 'package:ez_trip_app/widgets/back_btn.dart';
import 'package:ez_trip_app/widgets/feature_btn.dart';
import 'package:ez_trip_app/widgets/notif_btn.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

import '../providers/plan.dart';

class DetailWisata extends StatelessWidget {
  const DetailWisata({super.key});

  @override
  Widget build(BuildContext context) {

    final wisataId = ModalRoute.of(context)!.settings.arguments as String;
    final wisata =  Provider.of<AllWisata>(context)
        .findById(wisataId);
        
    final dataWisata = Provider.of<AllWisata>(context).allwisata;
    final plan = Provider.of<Plan>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 559,
                height: 372,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20)),
                  child: Image.network(
                    '${wisata!.imageURL}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackBTN(
                      nav: '/buttonnav',
                    ),
                    NotifBTN()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 330),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: Container(
                        width: 203,
                        height: 82,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${wisata.title}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.place_outlined,
                                    size: 15,
                                  ),
                                  Container(
                                    width: 165,
                                    child: Text(
                                      '${wisata.location}',
                                      style: TextStyle(
                                        fontSize: 10, overflow: TextOverflow.clip
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 85,
                      height: 82,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Berhasil ditambahkan'),
                                  duration: Duration(milliseconds: 500),
                                ));
                                plan.addPlan(
                                    wisata.id,
                                    wisata.imageURL,
                                    wisata.title,
                                    wisata.location);
                              },
                              child: Container(
                                width: 75,
                                height: 51,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      97,
                                      123,
                                      213,
                                      1,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            Text(
                              'Add Plan',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FeatureBTN(
                    icon: LineIcon.hotel(color: Colors.blueAccent, size: 35),
                    title: 'Penginapan'),
                FeatureBTN(
                    icon:
                        LineIcon.streetView(color: Colors.blueAccent, size: 35),
                    title: 'Tour Guide'),
                FeatureBTN(
                    icon: LineIcon.map(color: Colors.blueAccent, size: 35),
                    title: 'Maps'),
                FeatureBTN(
                    icon: LineIcon.bullhorn(color: Colors.blueAccent, size: 35),
                    title: 'TBA'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Container(
                width: 310,
                height: 2,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
            Container(
              width: 310,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children:[ Text('About Destination', style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 10,),
                      Text(
                        '${wisata.desc}',
                        overflow: TextOverflow.clip,
                      ),
                                  ]),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
