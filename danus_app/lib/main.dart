import 'package:danus_app/base_page.dart';
import 'package:danus_app/provider/product_provider.dart';
import 'package:danus_app/view/home_page.dart';
import 'package:danus_app/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  // await dotenv.load(fileName: ".env");

  initializeDateFormatting('id_ID', "").then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MaterialApp(
        // title: 'Your App Title',
        home: WelcomePage(),
      ),
    );
  }
}
