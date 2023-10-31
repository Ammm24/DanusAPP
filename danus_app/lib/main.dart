import 'package:danus_app/base_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // await dotenv.load(fileName: ".env");

  initializeDateFormatting('id_ID', "").then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Danusan HMIF',
      home: BasePage(),
    );
  }
}
