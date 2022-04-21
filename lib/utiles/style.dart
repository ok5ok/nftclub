import 'package:flutter/material.dart';

var theme = ThemeData(
  // 버튼스타일은 아래와 같이 해야한다. 외우자!!!
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        primary: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold)),
  ),
  iconTheme: const IconThemeData(color: Colors.black54),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.5,
    titleTextStyle: TextStyle(color: Colors.black54, fontSize: 20),
    actionsIconTheme: IconThemeData(color: Colors.black54),
    iconTheme: IconThemeData(color: Colors.black54),
  ),
  // 텍스트 일괄처리
  // textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black54)),
  //바텀네이게이션바 일괄처리
  // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //     elevation: 1.0,
  //     backgroundColor: Colors.white,
  //     selectedItemColor: Colors.black54),
);
