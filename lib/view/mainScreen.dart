import 'package:flutter/material.dart';
import 'package:meme_app/controller/fetchMeme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl = "";

  @override
  void initState() {
    super.initState();
    UpdateImg();
  }

  void UpdateImg() async {
    String getImageUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imgUrl = getImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Meme #1",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Target 500 memes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 30,
            ),
            Image.network(imgUrl),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  UpdateImg();
                },
                child: Container(
                    height: 50,
                    width: 150,
                    child: Center(
                        child: Text(
                      "More fun!!",
                      style: TextStyle(fontSize: 20),
                    )))),
            Spacer(),
            Text(
              "App created by",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Ayush Chauhan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
