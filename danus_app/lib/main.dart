import 'package:danus_app/view/welcome_page.dart';
import 'package:flutter/material.dart';

void main() async {
  // await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Danusan HMIF',
      home: WelcomePage(),
    );
  }
}
