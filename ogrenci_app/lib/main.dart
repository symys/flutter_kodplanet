import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black54,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70.0,
                      //backgroundColor: Colors.redAccent,
                      backgroundImage: AssetImage('assets/images/me.jpg'),
                    ),
                    Text(
                      'Merhaba, ben Şeyma !',
                      style: TextStyle(
                          fontFamily: 'Aclonica',
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      'Merhaba, ben Şeyma !',
                      style: GoogleFonts.pacifico(fontSize: 15, color: Colors.white)
                      ),
                    Container(
                      width: 200,
                      child: Divider(
                        height: 30,
                        color : Colors.redAccent
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 45.0
                      ),
                      color: Colors.blueGrey,
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color : Colors.white,
                        ),
                        title: Text('abc@gmail.com', style: TextStyle(
                            fontSize: 14,
                                color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Card(
                      margin: EdgeInsets.symmetric(
                          horizontal: 45.0
                      ),
                      color: Colors.blue,
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color : Colors.white,
                        ),
                        title: Text('abc@gmail.com', style: TextStyle(
                            fontSize: 14,
                            color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}