import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int redScore = 50;
  int blueScore = 50;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: redScore,
                  child: InkWell(
                    onTap: redScoreUpdate,
                    child: Container(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Expanded(
                  flex: blueScore,
                  child: InkWell(
                    onTap: blueScoreUpdate,
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
            redScore >= 100 || blueScore >= 100
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.purple.withOpacity(0.4),
                    child: Center(
                      child: Text(
                        "${redScore >= 100 ? "Red" : "Blue"} Won!!",
                        style: const TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(),
            redScore >= 100 || blueScore >= 100
                ? Positioned(
                    bottom: 300.0,
                    right: 130.0,
                    child: ElevatedButton(
                      onPressed: restartGame,
                      child: const Text(
                        "Play Again",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void blueScoreUpdate() {
    setState(() {
      blueScore = blueScore + 3;
      redScore = redScore - 3;
    });
  }

  void redScoreUpdate() {
    setState(() {
      redScore = redScore + 3;
      blueScore = blueScore - 3;
    });
  }

  void restartGame() {
    setState(() {
      redScore = 50;
      blueScore = 50;
    });
  }
}
