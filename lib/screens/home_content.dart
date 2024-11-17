
import 'package:flutter/material.dart';
import '../widgets/upei_logo_bar.dart';

// Ensure this class has a single responsibility.
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

// Ensure this class has a single responsibility.
class _HomeContentState extends State<HomeContent> {
  // Mock announcements list - Replace this with data fetched from a control panel/backend
  List<String> announcements = [
    'Midterm exams start next Monday. Prepare well!',
    'New cafeteria menu introduced from next week.',
    'Library will be closed on Friday for maintenance.',
  ];

  @override
  // Consider using const wherever possible to optimize performance.
Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <// Consider using const wherever possible to optimize performance.
Widget>[
          // UPEI Logo Bar at the top
          const UPEILogoBar(),

          // Events Section
          Container(
            color: const Color.fromARGB(255, 151, 22, 37),
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <// Consider using const wherever possible to optimize performance.
Widget>[
                Text(
                  'Upcoming Events',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                // Dummy Events, replace with API data
                Text(
                  'Orientation Day - Sep 15',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Career Fair - Sep 22',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Workshop - Sep 30',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          // Announcements Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <// Consider using const wherever possible to optimize performance.
Widget>[
                // Announcements Headline
                const Text(
                  'Announcements',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 151, 22, 37),
                  ),
                ),
                const SizedBox(height: 8),
                // Announcements List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(
                          Icons.announcement,
                          color: Color.fromARGB(255, 151, 22, 37),
                        ),
                        title: Text(announcements[index]),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
