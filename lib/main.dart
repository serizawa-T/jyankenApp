import 'dart:math';

import 'package:flutter/material.dart';
import 'package:janken2/judgePage.dart';

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
  String myHand = '';
  String computerHand = '';

  String result = '';
  String finalResult = '';

  int win = 0;
  int lose = 0;
  int draw = 0;
  int gameRound = 0;

  bool isDisabled = false;

  void gameReset() {
    myHand = '';
    computerHand = '';
    result = '';
    finalResult = '';
    win = 0;
    lose = 0;
    draw = 0;
    gameRound = 0;
    isDisabled = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initState();
  }

  void selectHand(String selectedHand) {
    setState(() {
      myHand = selectedHand;
    });
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand2(randomNumber);
  }

  String randomNumberToHand2(int randomNumber) {
    final hands = [rock, scissors, paper];
    return hands[randomNumber];
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
      draw += 1;
      gameRound += 1;
    } else if (myHand == rock && computerHand == scissors ||
        myHand == scissors && computerHand == paper ||
        myHand == paper && computerHand == rock) {
      result = '勝ち';
      win += 1;
      gameRound += 1;
    } else {
      result = '負け';
      lose += 1;
      gameRound += 1;
    }
  }

  void winLoseJudge() {
    if (win == lose) {
      finalResult = '引き分け';
    } else if (win < lose) {
      finalResult = 'meの負け';
    } else if (win > lose) {
      finalResult = 'meの勝ち';
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
            Text('$gameRoundラウンド', style: TextStyle(fontSize: 48)),
            Text(
              result,
              style: TextStyle(fontSize: 48),
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
                    onPressed: gameRound >= 5
                        ? null
                        : () {
                            selectHand(rock);
                            generateComputerHand();
                            judge();
                            // gameResetJudge();
                          },
                    child: Text(
                      rock,
                      style: TextStyle(fontSize: 24),
                    )),
                ElevatedButton(
                    onPressed: gameRound >= 5
                        ? null
                        : () {
                            selectHand(scissors);
                            generateComputerHand();
                            judge();
                            // gameResetJudge();
                          },
                    child: Text(
                      scissors,
                      style: TextStyle(fontSize: 24),
                    )),
                ElevatedButton(
                    onPressed: gameRound >= 5
                        ? null
                        : () {
                            selectHand(paper);
                            generateComputerHand();
                            judge();
                            // gameResetJudge();
                          },
                    child: Text(
                      paper,
                      style: TextStyle(fontSize: 24),
                    )),
              ],
            ),
            ElevatedButton(
                onPressed: gameRound < 5
                    ? null
                    : () {
                        winLoseJudge();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JudgePage(win, lose, draw, finalResult),
                          ),
                        ).then((value) {
                          setState(() {
                            gameReset();
                          });
                        });
                      },
                child: Text('結果をみる'))
          ],
        ),
      ),
    );
  }
}
