import 'package:flutter/material.dart';
import 'package:gawean/constants.dart';

class ThemeClass{


  static ThemeData lightTheme = ThemeData(
   /* brightness: Brightness.light,
    colorScheme: ColorScheme(
      primary: AppColor.kPrimaryColor,
      brightness: Brightness.light,
      onPrimary: null,
      secondary: AppColor.kSecondaryColor,
      onSecondary: null,
      error: AppColor.kErrorColor,
      onError: AppColor.kErrorBgColor,
      background: Colors.white,
      onBackground: null,
      surface: null,
      onSurface: null,
    ),*/
    scaffoldBackgroundColor: AppColor.kNeutral9,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(color: AppColor.kNeutral7)
          ),
          hintStyle: const TextStyle(
            color: AppColor.kNeutral7,
          ),
          filled: true,
          fillColor: AppColor.kNeutral8,
      )
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.kDark3,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.kNeutralBlack,
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(color: AppColor.kDark3),
        ),
        filled: true,
        fillColor: AppColor.kDark3,
    ),
  );

}