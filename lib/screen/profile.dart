import 'package:ez_trip_app/widgets/back_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: Row(
                  children: [
                    BackBTN(nav: '/buttonnav',),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'PROFILE',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/kapil.png'),
                    radius: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'mohammadkafil_',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 1, 0, 8),
                        child: Text('Mohammad Kafil Anjani',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w400)),
                      ),
                      Container(
                        width: 87,
                        height: 24,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                            child: Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 12),
                        )),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Container(
                            width: 65,
                            height: 49,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: LineIcon.globeWithAsiaShown(
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        Text('Trip History',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Account'),
                    TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            overlayColor: MaterialStateProperty.all(
                                const Color.fromRGBO(0, 0, 0, 0))),
                        onPressed: () {},
                        child: Text('Switch to Other Account')),
                    TextButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(0, 10)),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            overlayColor: MaterialStateProperty.all(
                                const Color.fromRGBO(0, 0, 0, 0))),
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.pushReplacementNamed(context, '/');
                          });
                          
                        },
                        child: Text('Log Out')),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
