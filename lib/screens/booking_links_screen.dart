import 'package:flutter/material.dart';
import 'webview_screen.dart';

class BookingLinksScreen extends StatelessWidget {
  final String accessToken;

  BookingLinksScreen({required this.accessToken});

  final List<Map<String, String>> bookingsLinks = [
    {
      'title': 'Yoga Class',
      'url': 'https://outlook.office365.com/owa/calendar/Yoga@yourdomain.com/bookings/'
    },
    {
      'title': 'Boxing Class',
      'url': 'https://outlook.office365.com/owa/calendar/Boxing@yourdomain.com/bookings/'
    },
  ];

  void _openWebView(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Microsoft Bookings'),
      ),
      body: ListView(
        children: bookingsLinks.map((link) {
          return ListTile(
            title: Text(link['title']!),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => _openWebView(context, link['url']!),
          );
        }).toList(),
      ),
    );
  }
}
