import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

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
        primarySwatch: Colors.amber,
      ),
      home: BaleBoardMainScreen(),
    );
  }
}

class BaleBoardMainScreen extends StatefulWidget {
  late final Soundpool _soundPool;
  final _soundClipstoSoundIds = {
    'amateur': 0,
    'answer': 0,
    'bale': 0,
    'get': 0,
    'good': 0,
    'he': 0,
    'idear': 0,
    'professional': 0,
    'set': 0,
    'think': 0,
  };

  BaleBoardMainScreen({super.key}) {
    _init();
  }

  @override
  State<BaleBoardMainScreen> createState() => _BaleBoardMainScreenState();
  void _init() async {
    _soundPool = Soundpool.fromOptions(
      options: const SoundpoolOptions(streamType: StreamType.music),
    );

    _soundClipstoSoundIds.forEach((clipTitle, soundId) async {
      final soundId = await rootBundle
          .load('assets/clips/$clipTitle.mp3')
          .then((ByteData soundData) => _soundPool.load(soundData));
      _soundClipstoSoundIds[clipTitle] = soundId;
    });
  }
}

class _BaleBoardMainScreenState extends State<BaleBoardMainScreen> {
  Widget _baleButton(String name) {
    return ElevatedButton(
      onPressed: () {
        final soundId = widget._soundClipstoSoundIds[name];
        if (soundId != null) {
          widget._soundPool.play(soundId);
        }
      },
      child: Text(name.toUpperCase()),
    );
  }

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
              'assets/images/impressive.gif',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _baleButton('idear'),
                _baleButton('professional'),
                _baleButton('think'),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _baleButton('answer'),
                _baleButton('get'),
                _baleButton('good'),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _baleButton('amateur'),
                _baleButton('set'),
                _baleButton('he'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
