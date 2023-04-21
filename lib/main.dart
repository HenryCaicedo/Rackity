import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rackity',
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the primary color to green
      ),
      home: const LoginScreen(),
    );
  }
}
