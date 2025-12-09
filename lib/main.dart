import 'package:flutter/material.dart';
import 'custom_navbar.dart';
import 'product_card.dart';
import 'home_page.dart';
import 'product_detail_page.dart';
import 'checkout_page.dart';

void main() {
  runApp(const MovrApp());
}

class MovrApp extends StatelessWidget {
  const MovrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOVR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
