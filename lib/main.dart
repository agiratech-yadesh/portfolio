import 'package:flutter/material.dart';
import 'package:for_portfolio/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Yadesh Kumar V',
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
