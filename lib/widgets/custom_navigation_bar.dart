import 'package:flutter/material.dart';

// Ensure this class has a single responsibility.
class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  // Consider using const wherever possible to optimize performance.
Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color.fromARGB(255, 97, 206, 112),
      unselectedItemColor: const Color.fromARGB(255, 151, 22, 37),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.share),
          label: 'SharePoint',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.link),
          label: 'Links',
        ),
      ],
    );
  }
}
