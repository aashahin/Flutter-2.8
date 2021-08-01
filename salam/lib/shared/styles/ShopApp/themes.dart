import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('232323'),
  primarySwatch: Colors.blueGrey,
  appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black38,
          statusBarIconBrightness: Brightness.light),
      backgroundColor: Colors.black38,
      titleTextStyle: GoogleFonts.cairo(
          textStyle: TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w700)),
      elevation: 5.0,
      iconTheme: IconThemeData(
        color: Colors.blueGrey,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('232323'),
    unselectedItemColor: HexColor('949494'),
    selectedItemColor: HexColor('ecf0f1'),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white70),
    bodyText2: TextStyle(color: Colors.grey),
  ),
  fontFamily: 'Cairo',
);
ThemeData lightTheme = ThemeData(
  // التحكم في التنسيق العام للتطبيق حيث مانضعه هنا يستخدم في كل الصفحات
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      // التحكم في شريط الحالة
      systemOverlayStyle: SystemUiOverlayStyle(
        // تنسيق شريط الحالة
          statusBarColor: Colors.white, // لونه
          statusBarIconBrightness: Brightness
              .dark // لون الأيقوانات , الافتراضي هو المظلم
      ),
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.cairo(
          textStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700)),
      elevation: 5.0,
      iconTheme: IconThemeData(
        color: Colors.deepOrange,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    elevation: 10,
    selectedItemColor: Color.fromARGB(255, 93, 42, 222),
    unselectedLabelStyle:
    GoogleFonts.cairo(textStyle: TextStyle(fontSize: 15)),
    selectedLabelStyle:
    GoogleFonts.cairo(textStyle: TextStyle(fontSize: 15)),
    unselectedItemColor: Colors.deepOrange,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black),
    bodyText2: TextStyle(color: Colors.grey),
  ),
  fontFamily: 'Cairo',
);