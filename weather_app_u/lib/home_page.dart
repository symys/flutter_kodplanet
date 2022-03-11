import 'package:flutter/material.dart';
import 'package:weather_app_u/search_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sehir = 'Ankara';
  int? sicaklik;
  var locationData;
  var woeid;
  var temp;

  Future<void> getLocation() async {
    locationData = await http.get(Uri.parse(
        'https://www.metaweather.com/api/location/search/?query=$sehir'));
    var locationDataParsed = jsonDecode(locationData.body);
    woeid = locationDataParsed[0]['woeid'];
  }

  Future<void> getTemperature() async {
    var temperatureData = await http
        .get(Uri.parse('https://www.metaweather.com/api/location/$woeid/'));
    var temperatureDataParsed = jsonDecode(temperatureData.body);
    //sicaklik = temperatureDataParsed['consolidated_weather'][0]['the_temp'];

    setState((){
      sicaklik = temperatureDataParsed['consolidated_weather'][0]['the_temp'].round();
      print('setState cagirildi');
    });
  }

  void getDataFromAPI() async {
    await getLocation();
    getTemperature();
  }

  @override
  void initState() {
    getDataFromAPI();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/c.jpg')),
      ),
      child: sicaklik == null ? Center(child: CircularProgressIndicator()):Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*FlatButton(
                onPressed: () async {
                  await getLocation();
                  print('http getten sonra calısan kod : $locationData');
                  //print(locationData.body);
                  //print(locationData.body.runtimeType); //burda tipini görüyoruz
                  //Future.delayed(Duration(seconds: 5), () {
                    //print('http getten sonra calısan kod : $locationData');
                  //});
                },
                child: Text('getLocation'),
                color: Colors.pink,
              ),*/
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
                      onPressed: () async {
                        sehir = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                        getDataFromAPI();
                        setState(() {
                          sehir = sehir;
                        });
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
