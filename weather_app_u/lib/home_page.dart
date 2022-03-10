import 'package:flutter/material.dart';
import 'package:weather_app_u/search_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sehir = 'Ankara';
  int sicaklik = 20;
  var locationData;

  Future<void> getLocation() async {
    locationData = await http.get(Uri.parse(
        'https://www.metaweather.com/api/location/search/?query=Ankara'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/c.jpg')),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () async {
                  await getLocation();
                  print('http getten sonra calısan kod : $locationData');
                  //Future.delayed(Duration(seconds: 5), () {
                    //print('http getten sonra calısan kod : $locationData');
                  //});
                },
                child: Text('getLocation'),
                color: Colors.pink,
              ),
              Text('$sicaklik °C',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$sehir',
                    style: TextStyle(fontSize: 30),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                      },
                      icon: Icon(Icons.search))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
