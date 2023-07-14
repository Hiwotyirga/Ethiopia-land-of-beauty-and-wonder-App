import 'package:exhange_rates_flutter/main2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../screens/home.dart';
import 'home screen.dart';
import 'one.dart';
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
    );
  }
}

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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(

        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text("Welcome to Ethiopia",
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
          elevation: 0.0,

        ),


        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(

              children: [
                AutomaticImageCarousel(),
                Container(
                  // padding: EdgeInsets.all(32),
                  child: Text(
                    "Ethiopia has reopened borders on September 23, 2020 and "
                        "is now again allowing tourists and foreigners to enter"
                        " the country Ethiopia was closed for a total of 6 months "
                        "since closing both land and air borders back on March 23rd in response to "
                        "the pandemic, which came as a real blow to the countrys economy,"
                        " throwing it off the record-breaking trajectory it was on.",
                    style: TextStyle(
                      fontSize: 16, // Set the font size
                      fontWeight: FontWeight.bold, // Set the font weight
                      fontStyle: FontStyle.normal, // Set the font style
                      letterSpacing: 1, // Set the letter spacing
                      color: Colors.black, // Set the text color
                      height: 1.5, // Set the line height
                    ),
                  ),

                ),
                // SizedBox(height: 16),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(25,12,25,12),
                //   child: Container(
                //     //padding: const EdgeInsets.fromLTRB(0,120,0,12),
                //     height: 200,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAV5Da4qLck8te35WqxL6XvoRDxmOLIL1hS01U975VVC4qy2LBu5kIQ5tkB4oEjmW389Y&usqp=CAU"),
                //         fit: BoxFit.cover,
                //       ),
                //       borderRadius32: BorderRadius.circular(16),
                //     ),
                //   ),
                // ),
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
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                )
              ],
            ),
          ),
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
                    MaterialPageRoute(builder: (context) => MyApp2()),
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
              // ListTile(
              //   leading: const Icon(Icons.translate),
              //   title: const Text(' Language Translator '),
              //   onTap: () {
              //     Navigator.pop(context); // close the drawer
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => CalendarPage()),
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.location_on),
              //   title: const Text(' Location '),
              //   onTap: _openMaps,
              // ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text(' Currency Converter '),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.comment),
                title: const Text(' Comment '),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestMe()),
                  );
                },
              ),




            ],
          ),
        ),

      ),
    );
  }
}

class AutomaticImageCarousel extends StatefulWidget {
  @override
  _AutomaticImageCarouselState createState() => _AutomaticImageCarouselState();
}

class _AutomaticImageCarouselState extends State<AutomaticImageCarousel> {
  final List<String> imageList = [
    "data:image/jpeg;base64,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",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLrZRzqlsHoahzA0o_Y4iycSsVcMO-aDVdyA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAe-sRAtlPUFrkyCLLm7s1CE5R7unLf75H4A&usqp=CAU",
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS79GRwUTyBKi9NLfI5vg7UaxVpfdmOcBKQWA&usqp=CAU',

    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYSHWVIjLkLrbf1f7qrw7NCV_MS7l-x6qSpw&usqp=CAU",
   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ44YKwqjbow32vSYcXOrK1-SLLEQBeKlzUzw&usqp=CAU",
    "data:image/jpeg;base64,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",


  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,12,0,12),
      child: Container(

        height: 200,
        child: CarouselSlider.builder(
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final imageUrl = imageList[index];
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 1000,
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: Text(
          'This is the calendar page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}



