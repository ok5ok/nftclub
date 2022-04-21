import 'package:flutter/material.dart';

class UpLoad extends StatefulWidget {
  const UpLoad({Key? key}) : super(key: key);

  @override
  State<UpLoad> createState() => _UpLoadState();
}

class _UpLoadState extends State<UpLoad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 입력창이 올라와서 overflow 되는거 방지!
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check,
                color: Colors.blue,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('업로드화면'),
            //Image.file(userImage), //ImagePicker 를 사용하여 추출한 image 띄움
            const TextField(
              decoration: InputDecoration(label: Text('작품소개를 적어주세요!')),
            ),
            IconButton(
              onPressed: () {
                //Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('작품을 올려 주세요~'),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('UpLoad'))
          ],
        ),
      ),
    );
  }
}
