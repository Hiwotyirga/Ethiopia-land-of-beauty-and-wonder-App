import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../screens/home.dart';
import 'home screen.dart';
import 'one.dart';
import 'package:exhange_rates_flutter/components/anyToAny.dart';
import 'package:exhange_rates_flutter/components/usdToAny.dart';
import 'package:exhange_rates_flutter/functions/fetchrates.dart';
import 'package:exhange_rates_flutter/models/ratesmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter App Home Page'),
      routes: {
        '/home': (context) => HomeePage(),
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  Future<void> _openMaps() async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=Addis+Ababa';
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text(
            "Welcome to Ethiopia",
          ),
          backgroundColor: Colors.indigo,
          centerTitle: true,
          elevation: 0.0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'About Us'),
              Tab(text: 'Contact Us'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AutomaticImageCarousel(),
                    Container(
                      child: Text(
                        "Ethiopia has reopened borders on September 23, 2020 and "
                            "is now again allowing tourists and foreigners to enter"
                            " the country Ethiopia was closed for a total of 6 months "
                            "since closing both land and air borders back on March 23rd in response to "
                            "the pandemic, which came as a real blow to the countrys economy,"
                            " throwing it off the record-breaking trajectory it was on.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 1,
                          color: Colors.black,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAV5Da4qLck8te35WqxL6XvoRDxmOLIL1hS01U975VVC4qy2LBu5kIQ5tkB4oEjmW389Y&usqp=CAU"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tourist destinations include Ethiopia's collection of national parks (including Semien Mountains National Park), and historic sites, such as the cities of Axum, Lalibela and Gondar, Harar Jugol walled city, Negash Mosque, in Negash and Sof Omar Caves. Developed in the 1960s, tourism declined greatly during the later .",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 1,
                            color: Colors.black                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text('Book Now'),
                    ),
                  ],
                ),
              ),
            ),
            AboutPage(),
            ContactPage(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About Us'),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_phone),
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openMaps,
          tooltip: 'Open Maps',
          child: Icon(Icons.map),
        ),
      ),
    );
  }
}

class AutomaticImageCarousel extends StatefulWidget {
  const AutomaticImageCarousel({Key? key}) : super(key: key);

  @override
  _AutomaticImageCarouselState createState() => _AutomaticImageCarouselState();
}

class _AutomaticImageCarouselState extends State<AutomaticImageCarousel> {
  int _currentIndex = 0;

  List<String> images = [
    "https://images.unsplash.com/photo-1630676672462-0f92d7a08f31?ixid=Mnwx"
        ".MjA5MzF8MHwxfGFsbHx8fHx8fDJ8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8tAup97KKssgElFFgXzEQhhqdISMNhrdIaA&usqp=CAU",
        ".MjA5MzF8MHwxfGFsbHx8fHx8fDJ8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1630676672462-0f92d7a08f31?ixid=Mnwx"
        ".MjA5MzF8MHwxfGFsbHx8fHx8fDJ8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final url = images[index];
            return Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  )),
            );
          },
          options: CarouselOptions(
            height: 180.0,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((url) {
            int index = images.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                _currentIndex == index ? Colors.blueAccent : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
        appBar: AppBar(
        title: Text('About Us'),
    ),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'About Us',
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey,
    ),
    ),
      ],
     ),
        ),
    ),
    );
  }
}
class HomeePage extends StatefulWidget {
  const HomeePage({Key? key}) : super(key: key);

  @override
  State<HomeePage> createState() => _HomeePageState();
}

class _HomeePageState extends State<HomeePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



