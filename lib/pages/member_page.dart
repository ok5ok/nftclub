import 'package:flutter/material.dart';
import 'package:nftclub/pages/favorite.dart';
import 'package:like_button/like_button.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 300,
            width: 350,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              image: const DecorationImage(
                  image: AssetImage('images/nft03.png'), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('1. Name : Tom'),
                const Text('2. Major : Art'),
                const Text('3. career : 15 years'),
                const Text(
                    '4. I am looking for good partners for our business! ^^ '),
                const Text('5. Please send me a massage'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Like_button 위젯을 임포트하여 사용하였다!
                    LikeButton(
                      size: 30,
                      isLiked: isLiked,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chat,
                          size: 30,
                          color: Colors.blue,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
