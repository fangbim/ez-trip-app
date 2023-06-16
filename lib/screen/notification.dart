import 'package:ez_trip_app/widgets/back_btn.dart';
import 'package:flutter/material.dart';

class Notif extends StatelessWidget {
  const Notif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: Row(
                children: [
                  BackBTN(nav: '/buttonnav',),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('NOTIFICATIONS',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Container(
              width: 305,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text('Bukit Larangan will be closed at 4 PM')),
            )
          ],
        ),
      )
    );
  }
}
