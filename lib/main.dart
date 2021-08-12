import 'package:flutter/material.dart';
import 'package:sevenlakes/first_page.dart';
import 'package:sevenlakes/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seven Lakes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputPage(),
      // MyHomePage(title: 'Seven Lakes Assignment'),
    );
  }
}

