import 'package:flutter/material.dart';
import 'home_content.dart';
import 'events_screen.dart';
import 'sharepoint_screen.dart';
import 'links_screen.dart'; // Import the modified LinksScreen
import '../widgets/custom_navigation_bar.dart';

// Ensure this class has a single responsibility.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Ensure this class has a single responsibility.
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List< // Consider using const wherever possible to optimize performance.
      Widget> _screens = [
    HomeContent(),
    EventsScreen(),
    SharePointScreen(),
    LinksScreen(), // Updated LinksScreen with Quizzes inside Academic Links
  ];

  @override
  // Consider using const wherever possible to optimize performance.
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
