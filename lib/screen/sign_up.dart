import 'package:ez_trip_app/widgets/custom_button.dart';
import 'package:ez_trip_app/widgets/custom_inputText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _CountryTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1554931670-4ebfabf6e7a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                      fit: BoxFit.cover))),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/EZ-Trip-Logo.png', height: 34),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Container(
                width: 294,
                height: 609,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(98, 131, 160, 1),
                    backgroundBlendMode: BlendMode.modulate),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Need to create a acount?',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 24),
                    ),
                  ),
                  CustomInputText(
                      hintText: 'Username',
                      scured: false,
                      textController: _usernameTextController),
                  CustomInputText(
                      hintText: 'Email',
                      scured: false,
                      textController: _emailTextController),
                  CustomInputText(
                      hintText: 'Phone Number',
                      scured: false,
                      textController: _phoneTextController),
                  CustomInputText(
                      hintText: 'Country',
                      scured: false,
                      textController: _CountryTextController),
                  CustomInputText(
                      hintText: 'Password',
                      scured: true,
                      textController: _passwordTextController),
                  CustomInputText(
                      hintText: 'Confirm Password',
                      scured: true,
                      textController: _confirmPasswordTextController),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: CustomButton(
                      inputText: 'Sign Up',
                      onPressed: () {
                        signup(context);
                      },
                    ),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromRGBO(0, 0, 0, 0))),
                      onPressed: ()  {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: const Text(
                        'Or Sign in',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ))
                ]),
              ),
            ),
          )
        ]));
  }

  Future signup(BuildContext context) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
        .then((value) {
      print("Create new account");
      Navigator.pushNamed(context, '/signin');
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
  }
}
