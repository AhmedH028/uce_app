import 'package:flutter/material.dart';

// Ensure this class has a single responsibility.
class UPEILogoBar extends StatelessWidget {
  const UPEILogoBar({super.key});

  @override
  // Consider using const wherever possible to optimize performance.
Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/images/upei_logo.png',
        width: 100,
        height: 100,
      ),
    );
  }
}
