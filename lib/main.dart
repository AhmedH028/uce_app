import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const UPEIApp());
}

// Ensure this class has a single responsibility.
class UPEIApp extends StatelessWidget {
  const UPEIApp({super.key});

  @override
  // Consider using const wherever possible to optimize performance.
Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UOC Mobile App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 151, 22, 37),
        hintColor: const Color.fromARGB(255, 97, 206, 112),
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
    );
  }
}
