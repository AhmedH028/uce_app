import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksScreen extends StatefulWidget {
  @override
  _LinksScreenState createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  String selectedTab = 'academic'; // Default tab

  // Academic Links
  final List<Map<String, String>> academicLinks = [
    {
      'title': 'University Portal',
      'url':
          'https://upeisis.uofcanada.edu.eg/PowerCampusSelfService/Home/LogIn'
    },
    {'title': 'Library Resources', 'url': 'https://library.upei.ca/'},
    {
      'title': 'Quizzes',
      'url':
          'https://upeisis.uofcanada.edu.eg/PowerCampusSelfService/Home/LogIn'
    },
    {
      'title': 'Helpdesk Email',
      'action': 'email',
      'email': 'helpdesk@uofcanada.edu.eg'
    },
    {'title': 'TUtrue', 'url': 'https://www.tutor2u.net/'},
    {'title': 'ICareer', 'url': 'https://uofcanadastudent.icareerhub.com/home'},
    {
      'title': 'Study Rooms Booking',
      'url':
          'https://outlook.office365.com/book/StudyRoomBooking@uofcanada.edu.eg/'
    },
    {
      'title': 'Academic Calendar',
      'url':
          'https://canwellnet.sharepoint.com/sites/UCEDL/IT%20Policies%20and%20Procedures/Forms/AllItems.aspx?id=%2Fsites%2FUCEDL%2FIT%20Policies%20and%20Procedures%2FAcademic%2FUPEI%20Cairo%20Campus%20Policies%20%26%20Procedures%2FCalendar%20Dates%202024%2E07%2E17%2Epdf&parent=%2Fsites%2FUCEDL%2FIT%20Policies%20and%20Procedures%2FAcademic%2FUPEI%20Cairo%20Campus%20Policies%20%26%20Procedures&p=true&ga=1'
    },
    {
      'title': 'Townhall',
      'url': 'https://canwellnet.sharepoint.com/sites/UCEDL'
    },
    {
      'title': 'Policies',
      'url':
          'https://canwellnet.sharepoint.com/sites/UCEDL/IT%20Policies%20and%20Procedures/Forms/AllItems.aspx'
    },
  ];

  // Non-Academic Links
  final List<Map<String, dynamic>> nonAcademicLinks = [
    {
      'title': 'Gym',
      'subItems': [
        {
          'title': 'Yoga',
          'url':
              'https://outlook.office365.com/book/GYMCLASSES@uofcanada.edu.eg/s/oYB9QuuJokeCGLZH09q75w2'
        },
        {
          'title': 'Boxing',
          'url':
              'https://outlook.office365.com/owa/calendar/GYMCLASSES@uofcanada.edu.eg/bookings/s/Dh_peETTIEapfnwAEfFdOA2'
        },
      ]
    },
    {
      'title': 'Bus Routes and Schedule',
      'url':
          'https://canwellnet-my.sharepoint.com/:b:/g/personal/ahmed_gad_uofcanada_edu_eg/EYlmlYbMstNEhoh613rmvxUB1UVvBm4jOu2wdO4TQNjV6Q?e=OScw56'
    },
    {'title': 'Fleet Manager', 'action': 'call', 'phone': '01008470311'},
    {
      'title': 'Location & Map',
      'action': 'map',
      'url': 'https://g.page/UofCanada/'
    },
  ];

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch email client');
    }
  }

  Widget _buildLinks(List<Map<String, dynamic>> links) {
    return ListView(
      children: links.map((link) {
        if (link.containsKey('action') && link['action'] == 'email') {
          return ListTile(
            title: Text(link['title']!),
            trailing: const Icon(Icons.mail),
            onTap: () => _launchEmail(link['email']!),
          );
        } else if (link.containsKey('subItems')) {
          return ExpansionTile(
            title: Text(link['title']),
            children: (link['subItems'] as List).map<Widget>((subLink) {
              return ListTile(
                title: Text(subLink['title']),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => _launchUrl(subLink['url']),
              );
            }).toList(),
          );
        } else if (link.containsKey('action') && link['action'] == 'call') {
          return ListTile(
            title: Text(link['title']!),
            trailing: const Icon(Icons.phone),
            onTap: () {
              final Uri telUri = Uri(scheme: 'tel', path: link['phone']);
              _launchUrl(telUri.toString());
            },
          );
        } else {
          return ListTile(
            title: Text(link['title']!),
            trailing: const Icon(Icons.open_in_browser),
            onTap: () => _launchUrl(link['url']!),
          );
        }
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = const Color.fromARGB(255, 97, 206, 112);
    final Color inactiveColor = const Color.fromARGB(255, 151, 22, 37);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Links'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = 'academic';
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.school,
                      size: 40,
                      color: selectedTab == 'academic'
                          ? activeColor
                          : inactiveColor,
                    ),
                    Text(
                      'Academic Links',
                      style: TextStyle(
                        color: selectedTab == 'academic'
                            ? activeColor
                            : inactiveColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = 'non-academic';
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.people,
                      size: 40,
                      color: selectedTab == 'non-academic'
                          ? activeColor
                          : inactiveColor,
                    ),
                    Text(
                      'Non-Academic Links',
                      style: TextStyle(
                        color: selectedTab == 'non-academic'
                            ? activeColor
                            : inactiveColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: selectedTab == 'academic'
                ? _buildLinks(academicLinks)
                : _buildLinks(nonAcademicLinks),
          ),
        ],
      ),
    );
  }
}
