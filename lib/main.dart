import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/tabs_screen.dart';

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0, // Set the standard elevation for all elevated buttons
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20), // Set the standard border radius for all elevated buttons
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
      routes: {
        '/tabs': (context) => TabsScreen(),
      },
    );
  }
}
