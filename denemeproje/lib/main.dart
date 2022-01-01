import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Limonatacım'),
        ),
        body: SafeArea(
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(26.0)),
            child: Transform(
              transform: Matrix4.rotationZ(-90),
                alignment: FractionalOffset.center,
                child: Text('Bu ne dünya kardeşim böyle')),
          ),
        ),
      ),
    );
  }
}
