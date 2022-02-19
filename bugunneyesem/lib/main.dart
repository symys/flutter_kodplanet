import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BUGÜN NE YESEM?',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  const YemekSayfasi({Key? key}) : super(key: key);

  @override
  _YemekSayfasiState createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;

  List<String> corbaAdlari = ['mercimek', 'tarhana', 'tavuk suyu', 'dugun', 'yogurtlu'];
  List<String> yemekAdlari = ['patlican', 'manti', 'kuru fasulye', 'icli kofte', 'balik'];
  List<String> tatliAdlari = ['kadayif', 'baklava', 'firin sutlac', 'kazandibi', 'dondurma'];

  void yemekleriYenile() {
    setState(() {
      corbaNo = Random().nextInt(5) + 1;
      yemekNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/corba_$corbaNo.jpg')),
            ),
          ),
          Text(corbaAdlari[corbaNo - 1]),
          Container(
            width: 200,
            child: Divider(
              height: 5,
              color: Colors.redAccent,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/yemek_$yemekNo.jpg')),
            ),
          ),
          Text(yemekAdlari[yemekNo - 1]),
          Container(
            width: 200,
            child: Divider(
              height: 5,
              color: Colors.redAccent,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/tatli_$tatliNo.jpg')),
            ),
          ),
          Text(tatliAdlari[tatliNo - 1]),
          Container(
            width: 200,
            child: Divider(
              height: 5,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
