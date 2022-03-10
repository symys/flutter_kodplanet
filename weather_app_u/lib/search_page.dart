import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/search.jpg')),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                    hintText: 'Şehir Seçiniz',
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
