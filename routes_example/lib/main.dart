import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.grey),
      home: HomePage(),
      //initialRoute: HomePage.routeHomeName,
      //routes: {
        //HomePage.routeHomeName : (context) => HomePage(),
       // RoutePink.routePinkName : (context)=>RoutePink(),
       // RouteGreen.routeGreenName : (context) => RouteGreen(),
       // RouteGrey.routeGreyName : (context) => RouteGrey()
      //}
      onGenerateRoute: (settings){
        switch(settings.name){
          case HomePage.routeHomeName:
            {return MaterialPageRoute(builder: (context) => HomePage());}
          case RoutePink.routePinkName:
            {return MaterialPageRoute( builder: (context) => RoutePink(settings.arguments as Kullanici));}
          case RouteGreen.routeGreenName:
            {return MaterialPageRoute(builder: (context) => RouteGreen());}
          case RouteGrey.routeGreyName:
            {return MaterialPageRoute(builder: (context) => RouteGrey());}
          default:
            return null;

        }
    },
      );
  }
}

class Kullanici{
  String? ad;
  String? adres;
  int? yas;

  Kullanici({this.ad, this.adres, this.yas});
}

class HomePage extends StatelessWidget {
  final Kullanici kullanici1 = Kullanici(ad: 'seyma', adres: 'ist', yas: 27);
  static const String routeHomeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('HomePage'),
            RaisedButton(
                child: Text('Git -> Route Pink'),
                onPressed: () {
                  Navigator.pushNamed(context, RoutePink.routePinkName, arguments: kullanici1);
                })
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {
  static const String routePinkName = '/routePink';
    RoutePink(this.yerelKullanici);
  final Kullanici yerelKullanici;


  @override
  Widget build(BuildContext context) {
   //Kullanici yerelKullanici = ModalRoute.of(context)!.settings.arguments as Kullanici;
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('kullanıcı adı : ${yerelKullanici.ad}'),
              Text('routepink acıldı'),
            RaisedButton(child: Text('Git -> Route Green'), onPressed: () {
              Navigator.pushNamed(context, '/routeGreen');


            }),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {
              Navigator.pop(context);

            }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////
class RouteGreen extends StatelessWidget {
  static const String routeGreenName = '/routeGreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGreen en üstte'),
            RaisedButton(child: Text('Git -> Route Grey'), onPressed: () {
              Navigator.pushNamed(context, RouteGreen.routeGreenName);


            }),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {
              Navigator.pop(context);
            }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////
class RouteGrey extends StatelessWidget {
  static const String routeGreyName = '/routeGrey';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGrey en üstte'),
            RaisedButton(child: Text('Git -> ....'), onPressed: () {}),
            RaisedButton(child: Text('Geri Dön'), onPressed: () {

              Navigator.pop(context);}),
          ])),
    );
  }
}