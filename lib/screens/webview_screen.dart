import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({required this.url, Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Launch the URL in the default browser
    _launchUrl(url);

    // Show a message while the link opens
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opening Link'),
      ),
      body: const Center(
        child: Text('Redirecting to browser...'),
      ),
    );
  }
}
