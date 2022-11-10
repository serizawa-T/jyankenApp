import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JyankenPage(),
    );
  }
}

class JyankenPage extends StatefulWidget {
  const JyankenPage({Key? key}) : super(key: key);

  @override
  State<JyankenPage> createState() => _JyankenPageState();
}

const String paper = '✋';
const String scissors = '✌️';
const String rock = '✊';

class _JyankenPageState extends State<JyankenPage> {
  String myHand = rock;
  String computerHand = rock;
  String result = '引き分け';

  void selectHand(String selectedHand) {
    setState(() {
      myHand = selectedHand;
    });
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand2(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return rock;
      case 1:
        return scissors;
      case 2:
        return paper;
      default:
        return rock;
    }
  }

  String randomNumberToHand2(int randomNumber) {
    final hands = [rock, scissors, paper];
    return hands[randomNumber];
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == rock && computerHand == scissors ||
        myHand == scissors && computerHand == paper ||
        myHand == paper && computerHand == rock) {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(fontSize: 64),
            ),
            Text(
              computerHand,
              style: TextStyle(fontSize: 64),
            ),
            SizedBox(
              height: 48,
            ),
            Text(
              myHand,
              style: TextStyle(fontSize: 64),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      selectHand(rock);
                      generateComputerHand();
                      judge();
                    },
                    child: Text(
                      rock,
                      style: TextStyle(fontSize: 24),
                    )),
                ElevatedButton(
                    onPressed: () {
                      selectHand(scissors);
                      generateComputerHand();
                      judge();
                    },
                    child: Text(
                      scissors,
                      style: TextStyle(fontSize: 24),
                    )),
                ElevatedButton(
                    onPressed: () {
                      selectHand(paper);
                      generateComputerHand();
                      judge();
                    },
                    child: Text(
                      paper,
                      style: TextStyle(fontSize: 24),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
