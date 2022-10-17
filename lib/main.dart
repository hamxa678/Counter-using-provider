import 'package:flutter/material.dart';
import 'package:providers/Example/Example_Screen.dart';
import 'package:providers/listview/listview_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Counter'),
    );
  }
}
