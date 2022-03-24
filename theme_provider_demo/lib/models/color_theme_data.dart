
import 'package:flutter/material.dart';



class ColorThemeData with ChangeNotifier{
  ThemeData greenTheme = ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(color: Colors.green),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          .copyWith(secondary: Colors.green));
  ThemeData redTheme = ThemeData(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(color: Colors.red),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
          .copyWith(secondary: Colors.red));

  ThemeData _selectedThemeData = ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(color: Colors.green),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          .copyWith(secondary: Colors.green));

  void changeTheme(bool selected){
    _selectedThemeData = selected ? greenTheme : redTheme;
    notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}