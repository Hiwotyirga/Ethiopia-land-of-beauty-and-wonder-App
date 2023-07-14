import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import 'one.dart';
import 'photo.dart';
import 'dart:async';
void main() => runApp(MyHomePage(title: 'hhhh',));
class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  Future<void> _openMaps() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=Addis+Ababa';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _search(String query) async {
    final url = 'https://www.google.com/search?q=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          MyApp(), // Add the new widget here
          Container(
            child:Text("Ethiopia has reopened borders on September 23, 2020 and is now again allowing tourists and foreigners to enter the country Ethiopia was closed for a total of 6 months since closing both land and air borders back on March 23rd in response to the pandemic, which came as a real blow to the countrys economy, throwing it off the record-breaking trajectory it was on.") ,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onSubmitted: _search,
              decoration: InputDecoration(
                hintText: 'Search Google',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  " ",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("Ethiopia: Land of Beauty And Wonder"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text(' Calendar '),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text(' Photo Gallery '),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhotoGallery()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.translate),
              title: const Text(' Language Translator '),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text(' Location '),
              onTap: _openMaps,
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text(' Currency Converter '),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrencyConverter()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text(' About Ethiopia '),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


