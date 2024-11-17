// Import the required packages and screens #AbdallaFayez
import 'package:flutter/material.dart';
import 'webview_screen.dart';

// Ensure this class has a single responsibility.
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  // Consider using const wherever possible to optimize performance.
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.event, size: 30),
                      onPressed: () {
                        Navigator.pushNamed(context, '/microsoftEvents');
                      },
                      tooltip: 'Microsoft Events',
                    ),
                    const Text('Events'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.schedule, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                              url:
                                  'https://uofcanada.edu.eg/', // Replace with actual SIS URL
                            ),
                          ),
                        );
                      },
                      tooltip: 'SIS Schedule',
                    ),
                    const Text('Schedule'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.health_and_safety,
                          size: 30), // Wellness icon
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                              url:
                                  'https://outlook.office365.com/owa/calendar/WellnessBookings@microsoft.com/bookings/', // Replace with actual Microsoft Booking URL
                            ),
                          ),
                        );
                      },
                      tooltip: 'Wellness Booking',
                    ),
                    const Text('Wellness'),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Events content here'),
            ),
          ),
        ],
      ),
    );
  }
}
