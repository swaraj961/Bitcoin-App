import 'package:flutter/material.dart';
import 'package:bitcoinapp/Price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF6B24FF),
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}