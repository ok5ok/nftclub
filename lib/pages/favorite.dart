import 'package:flutter/material.dart';
import 'package:nftclub/pages/member_page.dart';
import 'package:nftclub/utiles/lists.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  static List<String> likeListName = [
    'Tom',
    'Ann',
    'Yuri',
    'Eva',
    'Una',
    'Marie',
    'Gilbert',
    'Huk',
    'Jim',
    'Kim'
  ];
  static List<String> likeListImagePath = [
    'images/char01.png',
    'images/char02.png',
    'images/char03.png',
    'images/char04.png',
    'images/char05.png',
    'images/char06.png',
    'images/char07.png',
    'images/char08.png',
    'images/char09.png',
    'images/char1.0.png',
  ];
  static List<String> likeListLocation = [
    '100 M',
    '50 M',
    '2 Km',
    '5 Km',
    '300 M',
    '450 M',
    '700 M',
    '30 M',
    '20 Km',
    '350 Km'
  ];
  static List<String> likeListIntroduce = [
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
  ];

  final List<LikeList> likeData = List.generate(
      likeListName.length,
      (index) => LikeList(likeListName[index], likeListImagePath[index],
          likeListLocation[index], likeListIntroduce[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes list'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: likeData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(likeData[index].name),
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(likeData[index].imgPath),
                ),
                subtitle: Text(likeData[index].introduce),
                trailing: Text(likeData[index].location),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MemberPage(),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
