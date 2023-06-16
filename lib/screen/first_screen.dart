import 'package:ez_trip_app/screen/sign_in.dart';
import 'package:ez_trip_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                alignment: Alignment.topCenter,
                child:
                    Image.asset('assets/images/EZ-Trip-Logo.png', height: 34),  
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Container(
                        width: 294,
                        height: 196,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(98, 131, 160, 1),
                            backgroundBlendMode: BlendMode.modulate),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Let\'s Start Your Trip',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white)),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Discover such great travel experience',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white),
                              ),
                            ),
                            const Text(
                              'in your trip journey',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: CustomButton(
                                inputText: 'Let\'s Get Started',
                                onPressed: (() {
                                  Navigator.pushNamed(context, '/signup');
                                }),
                              ),
                            ),
                            TextButton(
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(0, 0, 0, 0))),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signin');
                                },
                                child: const Text(
                                  'Or Sign in',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ))
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
