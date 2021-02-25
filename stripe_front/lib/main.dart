import 'package:flutter/material.dart';
import 'package:stripe_front/pages/efective.dart';
import 'package:stripe_front/pages/existing-cards.dart';
import 'package:stripe_front/pages/home.dart';
import 'package:stripe_front/pages/paypal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        //scaffoldBackgroundColor: Color(0xff21232A),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/existing-cards': (context) => ExistingCardsPage(),
        '/paypal': (context) => PaypalPage(),
        '/efective': (context) => EfectivePage(),
      },
    );
  }
}
