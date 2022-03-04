import 'package:flutter/material.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/user_data.dart';
import 'calculate.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SONUÇ SAYFASI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(child: Text(
              Calculate(_userData).hesaplama().round().toString(),
              style: kMetinStili,)),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'geri dön',
                style: kMetinStili,
              ),
            ),
          )
        ],
      ),
    );
  }
}
