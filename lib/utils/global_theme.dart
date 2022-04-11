
import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
  // Define the default brightness and colors.

  primaryColor: Colors.lightBlue[800],
  secondaryHeaderColor: Colors.indigo[500],
  splashColor: Colors.blue, // цвет заголовка
  // Define the default font family.
  fontFamily: 'Georgia',
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.green).copyWith(
    secondary: Colors.cyan,
    primary: Colors.yellow,
  ),

  textTheme: const TextTheme(
      headline4: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.green),
      headline5: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
      headline6: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic),
  ),
  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.

    //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),

);