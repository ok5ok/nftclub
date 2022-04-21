import 'package:flutter/material.dart';
import 'package:nftclub/pages/member_page.dart';
import 'package:nftclub/utiles/lists.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  static List<String> chatListName = ['Marie', 'Gilbert', 'Huk', 'Jim', 'Kim'];
  static List<String> chatListImagePath = [
    'images/char06.png',
    'images/char07.png',
    'images/char08.png',
    'images/char09.png',
    'images/char1.0.png',
  ];
  static List<String> chatListLocation = [
    '450 M',
    '700 M',
    '30 M',
    '20 Km',
    '350 Km'
  ];
  static List<String> chatListIntroduce = [
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
    'Hi,I am good artist and creator who hopes to make good business with you ',
  ];

  final List<LikeList> chatData = List.generate(
      chatListName.length,
      (index) => LikeList(chatListName[index], chatListImagePath[index],
          chatListLocation[index], chatListIntroduce[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: chatData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(chatData[index].name),
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(chatData[index].imgPath),
                ),
                subtitle: Text(
                  chatData[index].introduce,
                  style: const TextStyle(fontSize: 12),
                ),
                trailing:

                    //Text(chatData[index].location),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chat,
                          size: 25,
                          color: Colors.blue,
                        )),
                isThreeLine: true,
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
