import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const Color textColor = Color(0xFF275844); // Add this line

  @override
  Widget build(BuildContext context) {
    final customTheme = ThemeData(
      primaryColor: const Color(0xFF63BFAE),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF63BFAE),
        secondary: const Color(0xFFF2A444),
        // Define textColor with your desired value
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rackity',
      theme: customTheme,
      home: const LoginScreen(),
      routes: {
        '/tabs': (context) => TabsScreen(),
      },
    );
  }
}
