import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nftclub/pages/favorite.dart';
import 'package:nftclub/pages/menu_page.dart';
import 'package:nftclub/pages/search_page.dart';
import 'package:nftclub/utiles/big_app_text.dart';
import 'package:nftclub/pages/member_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  int fabIconNumber = 0;
  Icon fab = const Icon(Icons.social_distance);

  List screen = [
    'image01.png',
    'image02.png',
    'image03.png',
  ];
  List screen02 = ['nft01.png', 'nft02.png', 'nft03.png'];

  List names = ["Tom", "Ann", "Yuri"];
  List characters = [
    "images/char01.png",
    "images/char02.png",
    "images/char03.png"
  ];
  List description = [
    '4.There are different types of careers you can pursue in your life. Which one will it be?',
    '7.There are different types of careers you can pursue in your life. Which one will it be?',
    '10.There are different types of careers you can pursue in your life. Which one will it be?',
  ];
  void showPopup(context, image, names, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                // 이미지를 배치하기위하여 선언! CircleAvatar 위젯과 비슷한 거임!
                // 이미지를 사각형 모양으로 출력해준다!
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        width: 200,
                        height: 200,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    names,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      description,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MemberPage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.remove_red_eye),
                        label: const Text('view'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        label: const Text('close'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // 반응형 앱을 위한 변수 선언!! 중요!! , *0.6 은 넓이의 60% 만 사용하겠다는 의미이다.
    double width = MediaQuery.of(context).size.width * 0.6;
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 1.1,
        child: fab,
        onPressed: () => setState(() {
          if (fabIconNumber == 0) {
            fab = const Icon(
              Icons.alarm,
              size: 30,
            );
            fabIconNumber = 1;
          } else {
            fab = const Icon(
              Icons.social_distance,
              size: 30,
            );
            fabIconNumber = 0;
          }
        }),
      ),
      body: SingleChildScrollView(
        //bottom에 overflow 나오는 애러를 해결했다!
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MenuPage())),
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      )),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          )),
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: const BigAppText(text: "K'NFT", size: 30),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  //labelPadding 이 정렬을 완벽하게 만드는 중요한 역활을 한다!
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator:
                      CircleTabIndicator(color: Colors.redAccent, radius: 5),
                  tabs: const [
                    Tab(text: "Art"),
                    Tab(text: "Music"),
                    Tab(text: "Videos"),
                    //Tab(text: "Games"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: const BigAppText(text: "creators", size: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.maxFinite,
              height: 220,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      itemCount: screen02
                          .length, //.length 로 바꾸고서야 Dialog 창 이미지가 제대로 붙었다!! 이유를 모르겟네...여튼 앞으로는 .length 로 처리하자!
                      //옆으로 스크롤되게 만들기
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        //Image 클릭을 위하여 Card를 InkWil() 로 wrap 했음!
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showPopup(context, characters[index],
                                    names[index], description[index]);
                                debugPrint(names[index]);
                              },
                              child: Card(
                                //card() 위젯으로 container()를 wrap 했음! 간단하다!
                                child: Container(
                                  height: 185,
                                  width: 185,
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/" + screen02[index]),
                                      // image 외곽을 꽉차게 만들었다!
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text("1 Km"),
                                SizedBox(
                                  width: 90,
                                ),
                                Text("20 Min")
                              ],
                            ),
                          ],
                        );
                      }),
                  ListView.builder(
                      itemCount: screen
                          .length, //.length 로 바꾸고서야 Dialog 창 이미지가 제대로 붙었다!! 이유를 모르겟네...여튼 앞으로는 .length 로 처리하자!
                      //옆으로 스크롤되게 만들기
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        //Image 클릭을 위하여 Card를 InkWil() 로 wrap 했음!
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showPopup(context, characters[index],
                                    names[index], description[index]);
                                debugPrint(names[index]);
                              },
                              child: Card(
                                //card() 위젯으로 container()를 wrap 했음! 간단하다!
                                child: Container(
                                  height: 185,
                                  width: 185,
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image:
                                          AssetImage("images/" + screen[index]),
                                      // image 외곽을 꽉차게 만들었다!
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text("1 Km"),
                                SizedBox(
                                  width: 90,
                                ),
                                Text("30 Min")
                              ],
                            ),
                          ],
                        );
                      }),
                  ListView.builder(
                      itemCount: screen
                          .length, //.length 로 바꾸고서야 Dialog 창 이미지가 제대로 붙었다!! 이유를 모르겟네...여튼 앞으로는 .length 로 처리하자!
                      //옆으로 스크롤되게 만들기
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        //Image 클릭을 위하여 Card를 InkWil() 로 wrap 했음!
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showPopup(context, characters[index],
                                    names[index], description[index]);
                                debugPrint(names[index]);
                              },
                              child: Card(
                                //card() 위젯으로 container()를 wrap 했음! 간단하다!
                                child: Container(
                                  height: 185,
                                  width: 185,
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image:
                                          AssetImage("images/" + screen[index]),
                                      // image 외곽을 꽉차게 만들었다!
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text("1 Km"),
                                SizedBox(
                                  width: 90,
                                ),
                                Text("2 Hour")
                              ],
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/banner.png"),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
