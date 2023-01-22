import 'package:audioplayers/audioplayers.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      home: BaleBoardMainScreen(),
    );
  }
}

class BaleBoardMainScreen extends StatefulWidget {
  // TODO: Use "soundpool" package instead?
  final audioPlayer = AudioPlayer(playerId: 'balePlayer');

  BaleBoardMainScreen({super.key});

  @override
  State<BaleBoardMainScreen> createState() => _BaleBoardMainScreenState();
}

class _BaleBoardMainScreenState extends State<BaleBoardMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bale Board'),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/impressive.gif',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.audioPlayer.play(
                      AssetSource('think.mp3'),
                    );
                  },
                  child: Text('think'.toUpperCase()),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.audioPlayer.play(
                      AssetSource('idear.mp3'),
                    );
                  },
                  child: Text('idear'.toUpperCase()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}