import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  String abbr = 'c';
  Position? position;

  List<int> temps = [2,1,3,4,5];
  List<String> abbrs = ["a","b","c","d","e"];
  List<String> dates = ["a","b","c","d","e"];

  Future<void> getDevicePosition() async {
    try{
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    }
    catch(error){
      print('Şu hata oluştu: $error');
    }
    //finally yazarsam her ne olursa olsun buradaki kod calıssın demis olurum

  }

  /*Future<Position?> determinePosition() async {
    LocationPermission permission;
    await Geolocator.checkPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }*/

  Future<void> getLocation() async {
    locationData = await http.get(Uri.parse(
        'https://www.metaweather.com/api/location/search/?query=$sehir'));
    var locationDataParsed = jsonDecode(locationData.body);
    woeid = locationDataParsed[0]['woeid'];
  }

  Future<void> getLocationLatLong() async {
    locationData = await http.get(Uri.parse(
        'https://www.metaweather.com/api/location/search/?lattlong=${position!.latitude}, ${position!.longitude}'));
    //var locationDataParsed = jsonDecode(locationData.body); //burada turkce karakter calismiyor
    var locationDataParsed = jsonDecode(utf8.decode(locationData.bodyBytes));

    woeid = locationDataParsed[0]['woeid'];
    sehir = locationDataParsed[0]['title'];
  }

  Future<void> getTemperature() async {
    var temperatureData = await http
        .get(Uri.parse('https://www.metaweather.com/api/location/$woeid/'));
    var temperatureDataParsed = jsonDecode(temperatureData.body);
    //sicaklik = temperatureDataParsed['consolidated_weather'][0]['the_temp'];

    setState(() {
      sicaklik =
          temperatureDataParsed['consolidated_weather'][0]['the_temp'].round();
      abbr = temperatureDataParsed['consolidated_weather'][0]
      ['weather_state_abbr'];

      for(int i = 0; i < 5; i++){
        temps[i] = temperatureDataParsed['consolidated_weather'][i+1]['the_temp'].round();
        abbrs[i] = temperatureDataParsed['consolidated_weather'][i+1]
        ['weather_state_abbr'];
        dates[i] = temperatureDataParsed['consolidated_weather'][i+1]
        ['applicable_date'];
      }
      print('setState cagirildi');
    });
  }

  void getDataFromAPI() async {
    await getDevicePosition(); //cihazdan konum bilgisi cekiyor
    await getLocationLatLong(); //API'dan lat-long ile woeid bilgisi cekiyor
    getTemperature(); //woeid bilgisiyle sıcaklık verisi cekiyor
  }

  void getDataFromAPIbyCity() async {
    await getLocation(); //API'dan lat-long ile woeid bilgisi cekiyor
    getTemperature(); //woeid bilgisiyle sıcaklık verisi cekiyor
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
            fit: BoxFit.cover,
            image: AssetImage('assets/images/$abbr.jpg')),
      ),
      child: sicaklik == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
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
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.network('https://www.metaweather.com/static/img/weather/png/$abbr.png'),
                    ),
                    Text('$sicaklik °C',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                offset: Offset(-3, 3))
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$sehir',
                          style: TextStyle(
                            fontSize: 30,
                            shadows: <Shadow>[
                              Shadow(
                                  color: Colors.black38,
                                  blurRadius: 5,
                                  offset: Offset(-3, 3))
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              sehir = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchPage()));
                              getDataFromAPIbyCity();
                              setState(() {
                                sehir = sehir;
                              });
                            },
                            icon: Icon(Icons.search))
                      ],
                    ),
                    SizedBox(height: 100,),
                    buildDailyWeatherCards(context),
                  ],
                ),
              ),
            ),
    );
  }

  Container buildDailyWeatherCards(BuildContext context) {
    List<Widget> cards = [DailyWeather(image: abbrs[0], temp: temps[0].toString(), date: dates[0]),
      DailyWeather(image: abbrs[0], temp: temps[0].toString(), date: dates[0]),
      DailyWeather(image: abbrs[0], temp: temps[0].toString(), date: dates[0]),
      DailyWeather(image: abbrs[0], temp: temps[0].toString(), date: dates[0]),
      DailyWeather(image: abbrs[0], temp: temps[0].toString(), date: dates[0]),];
    for(int i = 0; i < 5; i++){
      cards[i] = DailyWeather(image: abbrs[i], temp: temps[i].toString(), date: dates[i]);
    }

    return Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*0.9,
                    child: ListView(
                      children: cards,
                      scrollDirection: Axis.horizontal,

                    ),
                  );
  }
}

class DailyWeather extends StatelessWidget {
  final String image;
  final String temp;
  final String date;

  const DailyWeather({Key? key, required this.image, required this.temp, required this.date}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> weekdays = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi", "Pazar"];
    String weekday = weekdays[DateTime.parse(date).weekday-1];

    return Card(
      elevation: 2,
      color: Colors.transparent,
      child: Container(
        height: 120,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network('https://www.metaweather.com/static/img/weather/png/$image.png',
            height: 50,
            width: 50,),
            Text('$temp  °C'),
            Text(weekday)
          ],
        ),
      ),
    );
  }
}

