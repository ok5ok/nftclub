import 'package:flutter/material.dart';
import 'package:nftclub/pages/main_page.dart';
import 'package:nftclub/utiles/style.dart ' as style;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NFT club Demo',
      theme: style.theme,
      /*ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: const MainPage(),
    );
  }
}
