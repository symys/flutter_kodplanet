import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/color_theme_data.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('tema seçimi yapınız'),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatefulWidget {
  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  bool _value=true;

  @override
  Widget build(BuildContext context) {

    Text greenText = Text('Green',style: TextStyle(color: Colors.green),);
    Text redText = Text('Red',style: TextStyle(color: Colors.red),);

    return Card(
      child: SwitchListTile(
        subtitle: _value? greenText : redText,
        title: Text('Change Theme Color', style: TextStyle(color: Colors.black),),
        onChanged: (bool value) {
          setState(() {
            _value = value;
          });
          Provider.of<ColorThemeData>(context, listen: false).changeTheme(value);
        },
        value: _value,
      ),
    );
  }
}
