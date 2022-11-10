import 'package:flutter/material.dart';
import 'package:janken2/main.dart';

class JudgePage extends StatelessWidget {
  int win;
  int lose;
  int draw;
  String finalResult;

  JudgePage(this.win, this.lose, this.draw, this.finalResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop(JyankenPage());
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              finalResult,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'win',
                      style: TextStyle(fontSize: 48),
                    ),
                    Text(
                      '$win',
                      style: const TextStyle(fontSize: 32),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'lose',
                      style: TextStyle(fontSize: 48),
                    ),
                    Text(
                      '$lose',
                      style: const TextStyle(fontSize: 32),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'draw',
                      style: TextStyle(fontSize: 48),
                    ),
                    Text(
                      '$draw',
                      style: const TextStyle(fontSize: 32),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
