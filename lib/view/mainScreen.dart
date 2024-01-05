import 'package:flutter/material.dart';
import 'package:meme_app/controller/fetchMeme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl = "";
  int memeNo = 1;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    UpdateImg();
  }

  void UpdateImg() async {
    String getImageUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imgUrl = getImageUrl;
      isLoading = false;
    });
  }

  void IncMemeCount() {
    memeNo++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 162, 248, 164),
              Color.fromARGB(255, 133, 226, 198)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130,
              ),
              Text("Meme #${memeNo.toString()}"),
              SizedBox(
                height: 20,
              ),
              isLoading
                  ? Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    )
                  : Image.network(imgUrl, height: 350, width: 320),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    UpdateImg();
                    IncMemeCount();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 242, 175, 217),
                            Color.fromARGB(255, 227, 245, 150)
                          ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          width: 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'More Fun',
                            style: TextStyle(fontSize: 18),
                          )))),
              Spacer(),
              Text(
                "App created by",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Ayush Chauhan",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
