import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 176, 189, 200),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "Match images",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: ImagePage(),
      ),
    );
  }
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var leftImageNumber = 1;
  var rightImageNumber = 1;

  void changeLeffAndRightImageNumbers() {
    leftImageNumber = Random().nextInt(8) + 1;
    rightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber ? "Good!" : "Try again",
          style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: () {
                  setState(() {
                    changeLeffAndRightImageNumbers();
                  });
                },
                child: Image.asset("images/image-$leftImageNumber.png"),
              )),
              Expanded(
                  child: TextButton(
                child: Image.asset("images/image-$rightImageNumber.png"),
                onPressed: () {
                  setState(() {
                    changeLeffAndRightImageNumbers();
                  });
                },
              )),
            ],
          ),
        )
      ],
    );
  }
}
