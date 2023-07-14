import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage(),
  ));
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<Map<String, dynamic>> imagePaths = [
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYnlTnvckE_kFKmeA7hbHEeIgVSX8-DO5mfg&usqp=CAU',
      'description': 'The Danakil Depression is the northern part of the Afar Triangle or Afar Depression in Ethiopia, a geological depression that has resulted from the divergence of three tectonic plates in the Horn of Africa',
      'latitude': 14.2417,
      'longitude': 40.2994,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://addisstandard.com/wp-content/uploads/2021/09/Feature.jpg',
      'description': 'The Blue Nile Falls region is one of the most beautiful natural areas in Ethiopia and is located near the city of Bahr Dar, which overlooks Lake Tana, which feeds the Blue Nile waterfalls. The height of the Blue Nile waterfalls reaches about 40 meters and its width, which varies in different seasons, reaches 400 meters.',
      'latitude': 12.6092,
      'longitude': 37.4665,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-3jxAwEzqVWdnvohGEADyqupjeT5tbE9mmQ&usqp=CAU',
      'description': 'The Walia Ibex is a species of goat-like antelope native to Ethiopia, and it is found in the Simien Mountains National Park. The park is located in the northern part of Ethiopia',
      'latitude': 13.2408,
      'longitude': 38.2185,
      'icon': Icons.location_on,
    },
    {
      'url':'data:image/jpeg;base64,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',
      'description': 'The Blue Nile (Amharic: ጥቁር አባይ, romanized: T’ik’uri Ābayi; Arabic: النيل الأزرق, romanized: an-Nīl al-ʾAzraqu) is a river originating at Lake Tana in Ethiopia. ',
      'latitude': 9.1450,
      'longitude': 40.4897,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk5mZ9kQCIyKsIVdQNZlOKnFjm3w1MYBQufg&usqp=CAU',
      'description': 'Erta Ale (or Ertale or Irta ale; Amharic: ኤርታሌ) is a continuously active basaltic shield volcano in the Afar Region of northeastern Ethiopia, which is itself part of the wider Afar Triangle (a barren desert region straddling Djibouti, Ethiopia and Eritrea). Erta Ale is located in the Danakil Depression, an area below sea level between the last two countries, and is the most active volcano in Ethiopia',
      'latitude':  59.9,
      'longitude': 59.99,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJbyBNN2I8uW2ykHHGaKL0PXUrJNGyGDf5yA&usqp=CAU',
      'description': 'Nech Sar National Park is a national park in southern Ethiopia, known for its diverse wildlife and scenic landscapes',
      'latitude':  6.3531,
      'longitude': 37.5088,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToojqCso93SYdcnfPTW--rzD4C3ga43BCjpQ&usqp=CAU',
      'description': 'The Simien Mountains National Park is a national park in northern Ethiopia, known for its stunning mountain landscapes and unique wildlife',
      'latitude': 13.1667,
      'longitude': 38.2167,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6VA5Tg-wU6mqva7iejh2eTU0Dg049oFUxEw&usqp=CAU',
      'description': 'Konso is a town in southern Ethiopia, known for its unique cultural traditions and UNESCO World Heritage Site',
      'latitude': 5.2500,
      'longitude': 37.5000,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsnufjnNhycIjMvIIoyfulCTITm1VEC52dxw&usqp=CAU',
      'description': 'Bale Mountains National Park is a national park in southeast Ethiopia, known for its high-altitude mountains, unique wildlife, and diverse ecosystems',
      'latitude': 6.8750,
      'longitude': 39.5333,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiDToX3KkputcYQ-bhWoZqu8iGGW3FCtj-3g&usqp=CAU',
      'description': 'Awash National Park is a national park in Ethiopia, located in the Afar Region.',
      'latitude': 8.9500,
      'longitude': 40.1833,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYttr0S2e0XVyeD8N5Spr-krSEkK83s7WZfQ&usqp=CAU',
      'description': 'This is the first image',
      'latitude': 37.7749,
      'longitude': -122.4194,
      'icon': Icons.location_on,
    },
    {
      'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWcrwHgZ6yHEf2vE-AkusTNMoP2Zpoej2yYQ&usqp=CAU',
      'description': 'In Ethiopia Satellite map of Sof Omar Caves Sof Omar Cave is the longest cave in Ethiopia at 15.1 kilometres (9.4 mi) long; sources claim it is the longest system of caves in Africa.',
      'latitude': 12.0294,
      'longitude': 39.0445,
      'icon': Icons.location_on,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Natura attraction',
          textAlign: TextAlign.center,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: imagePaths.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhotoView(
                          imageProvider:
                          NetworkImage(imagePaths[index]['url']),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 120.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: imagePaths[index]['url'],
                            child: Image.network(
                              imagePaths[index]['url'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  imagePaths[index]['description'],
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    launchMapsUrl(
                                        imagePaths[index]['latitude'],
                                        imagePaths[index]['longitude']);
                                  },
                                  child: Icon(
                                    imagePaths[index]['icon'],
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void launchMapsUrl(double latitude, double longitude) async {
    print('Launching Maps app with latitude: $latitude, longitude: $longitude');
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}