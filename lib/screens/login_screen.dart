// File: /mnt/data/login_screen.dart
// Description: Dart file for managing specific functionality in the application.
// Suggestions: Ensure modularity, error handling, and clean coding practices.
// Updated as per recommendations by Abdalla Fayez

import 'package:flutter/material.dart';
import 'home_screen.dart';

// Ensure this class has a single responsibility.
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  // Consider using const wherever possible to optimize performance.
Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Dismisses keyboard when tapping outside #AbdallaFayez
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <// Consider using const wherever possible to optimize performance.
Widget>[
                  // UPEI Logo at the top
                  Image.asset(
                    'assets/images/upei_logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'UOC Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 151, 22, 37),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'University Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 151, 22, 37),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      // Validate email and password input #AbdallaFayez
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } else {
                        // Show error if fields are empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please enter both email and password.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
