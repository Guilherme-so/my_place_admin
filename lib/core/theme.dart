import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.deepOrange,
  primaryColorLight: Colors.deepOrange[200],
  primaryColorDark: Colors.deepOrange[800],
  colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.deepOrange,
      onPrimary: Colors.white,
      secondary: Colors.grey.shade800,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.grey.shade100,
      onBackground: Colors.grey.shade800,
      surface: Colors.white,
      onSurface: Colors.grey.shade900),
  scaffoldBackgroundColor: Colors.grey.shade100,
  visualDensity: VisualDensity.comfortable,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.5,
    color: Colors.grey.shade100,
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.deepOrange,
    ),
    toolbarTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.grey.shade800,
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade50),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade600),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade600),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
