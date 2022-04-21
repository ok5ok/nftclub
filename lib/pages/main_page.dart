import 'package:flutter/material.dart';
import 'package:nftclub/pages/chat_list.dart';

import 'package:nftclub/pages/favorite.dart';
import 'package:nftclub/pages/home_Tab.dart';
import 'package:nftclub/pages/shop.dart';
import 'package:nftclub/pages/up_load.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> pages = <Widget>[
    const HomeTab(),
    const Favorite(),
    const UpLoad(),
    const ChatList(),
    const Shop()
  ];
  void onPageTaped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: pages[currentIndex],
      //drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onPageTaped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        iconSize: 30,
        type: BottomNavigationBarType.fixed, // 각 아이콘 재자리 정렬
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorite',
              activeIcon: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                size: 40,
              ),
              label: 'Create',
              activeIcon: Icon(Icons.add_circle, size: 40)),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: 'Chat',
              activeIcon: Icon(Icons.chat)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_2_outlined),
              label: 'Store',
              activeIcon: Icon(Icons.shop_2))
        ],
      ),
    );
  }
}
