import 'package:ez_trip_app/screen/home.dart';
import 'package:ez_trip_app/widgets/button_nav_bar.dart';
import 'package:ez_trip_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_inputText.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1554481923-a6918bd997bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
            ),
            fit: BoxFit.cover,
          ))),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/EZ-Trip-Logo.png', height: 34),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 294,
                    height: 335,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(98, 131, 160, 1),
                        backgroundBlendMode: BlendMode.modulate),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Hey there, welcome back',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 24),
                        ),
                      ),
                      CustomInputText(
                          hintText: 'Email or username',
                          scured: false,
                          textController: _emailTextController),
                      CustomInputText(
                        hintText: 'Password',
                        scured: true,
                        textController: _passwordTextController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 135),
                        child: Text('Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CustomButton(
                          inputText: 'Sign In',
                          onPressed: () {
                            signIn(context);
                          },
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          )
        ]));
  }

  Future signIn(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
        .then((value) {
      Navigator.pushReplacementNamed(context, '/buttonnav');
      print('Login Berhasil');
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
  }
}
