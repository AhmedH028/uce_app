// Import the required packages and screens #AbdallaFayez
import 'package:flutter/material.dart';
import 'webview_screen.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Microsoft Events Section
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.event, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(
                              url: 'https://microsoft.com/events', // Replace with the correct Microsoft Events URL
                            ),
                          ),
                        );
                      },
                      tooltip: 'Microsoft Events',
                    ),
                    const Text('Events'),
                  ],
                ),
                // SIS Schedule Section
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.schedule, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(
                              url: 'https://upeisis.uofcanada.edu.eg/PowerCampusSelfService/Home/LogIn', // Replace with the actual SIS URL
                            ),
                          ),
                        );
                      },
                      tooltip: 'SIS Schedule',
                    ),
                    const Text('Schedule'),
                  ],
                ),
                // Wellness Booking Section
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.health_and_safety, size: 30), // Wellness icon
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(
                              url: 'https://outlook.office365.com/owa/calendar/WellnessBookings@microsoft.com/bookings/', // Correct URL for Wellness Booking
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
          // Placeholder for additional event content
          const Expanded(
            child: Center(
              child: Text(
                'Events content here',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
