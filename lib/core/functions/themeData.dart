// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:progres/core/constant/appColors.dart';

ThemeData darkThemArabic = ThemeData(
    fontFamily: "Cairo",
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey[900]!,
      secondary: Colors.grey[800]!,
    ));
ThemeData darkThem = ThemeData(
    fontFamily: "Poppins",
    iconTheme: const IconThemeData(color: Colors.white),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDarkColor,
      secondary: AppColors.secondaryDarkColor,
    ));
ThemeData lightThemArabic = ThemeData(
  fontFamily: "Cairo",
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: Colors.white,
  ),
);
ThemeData lightThem = ThemeData(
    fontFamily: "Poppins",
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.grey,
      )),
    ));
