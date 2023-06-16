import 'package:ez_trip_app/providers/plan.dart';
import 'package:ez_trip_app/widgets/listdays.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/back_btn.dart';
import '../widgets/card_plan.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final planData = Provider.of<Plan>(context, listen: false);
    TimeOfDay? time = TimeOfDay(hour: 0, minute: 0);
    
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Row(
              children: [
                BackBTN(
                  nav: '/buttonnav',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'TRIP DETAILS PLAN',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 42,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(190, 190, 190, 1),
                        borderRadius: BorderRadius.circular(3)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  ListDays(day: 'Day1', date: '08 Nov 2022'),
                  ListDays(day: 'Day2', date: '09 Nov 2022'),
                  ListDays(day: 'Day3', date: '10 Nov 2022'),
                  ListDays(day: 'Day4', date: '11 Nov 2022')
                ],
              ),
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
          
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 470),
            child: ListView.builder(
              itemCount: planData.plans.length,
              itemBuilder: (context, index) {
              return  CardPlan(
                  nama: '${planData.plans.values.toList()[index].name}',
                  lokasi: '${planData.plans.values.toList()[index].lokasi}',
                  imageURL: '${planData.plans.values.toList()[index].imageURL}',
              );
            },),
          ),
        ],
      ),
    ),);
  }
}

