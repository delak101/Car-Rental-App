import 'package:car_rental_app/screens/Home/signin.dart';
import 'package:car_rental_app/screens/Home/signup.dart';
import 'package:flutter/material.dart';
import 'screens/Home/car_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
