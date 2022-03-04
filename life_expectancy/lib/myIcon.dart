import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyIcon extends StatelessWidget {
  final IconData? icon;
  final String? cinsiyet;
  MyIcon({this.icon = FontAwesomeIcons.addressBook, this.cinsiyet = 'Default'});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.black38, size: 50),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet!,
          style: TextStyle(
              color: Colors.black38, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}