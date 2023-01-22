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
        primarySwatch: Colors.blue,
      ),
      home: const BaleBoardHomePage(title: 'Bale Board'),
    );
  }
}

class BaleBoardHomePage extends StatefulWidget {
  final String title;
  const BaleBoardHomePage({super.key, required this.title});

  @override
  State<BaleBoardHomePage> createState() => _BaleBoardHomePageState();
}

class _BaleBoardHomePageState extends State<BaleBoardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/impressive.gif',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // TODO: Use "soundpool" package instead?
                  final player = AudioPlayer(playerId: 'test');
                  await player.play(
                    AssetSource('think.mp3'),
                  );
                  // player.play(source)
                },
                child: Text('think'.toUpperCase()),
              ),
              ElevatedButton(
                onPressed: () async {
                  final player = AudioPlayer(playerId: 'test');
                  await player.play(
                    AssetSource('idear.mp3'),
                  );
                  // player.play(source)
                },
                child: Text('idear'.toUpperCase()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
