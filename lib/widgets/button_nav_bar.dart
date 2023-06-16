import 'package:ez_trip_app/screen/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screen/home.dart';
import '../screen/profile.dart';

class ButtonNavbar extends StatefulWidget {
  const ButtonNavbar({super.key});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<ButtonNavbar> {
  int _slectedIndex = 0;
  static const List<Widget> _PageOptions = <Widget>[Home(), PlanScreen(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _PageOptions[_slectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(33, 70, 199, 1),
              borderRadius: BorderRadius.circular(50)),
          child: GNav(
            iconSize: 25,
            textSize: 15,
            gap: 5,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromRGBO(97, 123, 213, 1),
            padding: const EdgeInsets.all(10),
            tabMargin: const EdgeInsets.all(10),
            selectedIndex: _slectedIndex,
            onTabChange: (index) => {
              setState(() => _slectedIndex = index),
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.track_changes_rounded,
                text: 'Trip',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
