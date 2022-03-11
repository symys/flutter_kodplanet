import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? secilenSehir;
  final myController = TextEditingController();

  void _showDialog() {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: new Text("HATA !"),
        content: Text('Geçersiz bir şehir girildi'),
        actions: <Widget>[
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Kapat'))
        ],
      );
    });
  }

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
                  controller: myController,
                  /*onChanged: (value) {
                    secilenSehir = value;
                  },*/
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                    hintText: 'Şehir Seçiniz',
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(onPressed: () async {
                var response = await http.get(Uri.parse(
                    'https://www.metaweather.com/api/location/search/?query=${myController.text}'));
                jsonDecode(response.body).isEmpty ? _showDialog() :
                Navigator.pop(context, myController.text);
              }, child: Text('ARA'))
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
