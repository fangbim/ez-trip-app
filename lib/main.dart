import 'package:ez_trip_app/providers/all_wisata.dart';
import 'package:ez_trip_app/providers/plan.dart';
import 'package:ez_trip_app/screen/detail_wisata_screen.dart';
import 'package:ez_trip_app/screen/home.dart';
import 'package:ez_trip_app/screen/notification.dart';
import 'package:ez_trip_app/screen/sign_in.dart';
import 'package:ez_trip_app/screen/sign_up.dart';
import 'package:ez_trip_app/widgets/button_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/first_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AllWisata(),
        ),
        ChangeNotifierProvider(
          create: (context) => Plan(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(fontFamily: 'Inter'),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => MyScreen(),
            '/buttonnav': (context) => ButtonNavbar(),
            '/signin': (context) => SignIn(),
            '/signup': (context) => SignUp(),
            '/home': (context) => Home(),
            '/destinfo': (context) => DetailWisata(),
            '/notification': (context) => Notif()
          })));

  FlutterNativeSplash.remove();
}
  