import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imaginary Cat Notifier',
      theme: ThemeData(
        primaryColor: Colors.orange[300],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ).copyWith(
          secondary: Colors.pink[300],
        ),
        fontFamily:
            'ComicSans', // Just an example; specify the font you intend to use
      ),
      home: const MyHomePage(title: 'Meow Settings 🐱'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNotificationEnabled = true;
  String catName = "Kitty";
  double notificationInterval = 1;

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.pets),
            onPressed: () async {
              await player.play(AssetSource('cats1.mp3'));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: Text(
                'Enable Meowtifications 🐾',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.pets),
                labelText: 'Cat\'s Name 🐱',
                hintText: 'Enter your imaginary cat\'s name',
              ),
              onChanged: (String value) {
                setState(() {
                  catName = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Meowtification Interval 🕰️',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Slider(
              value: notificationInterval,
              min: 1,
              max: 24,
              divisions: 23,
              label: '${notificationInterval.round()} hrs',
              onChanged: (double value) {
                setState(() {
                  notificationInterval = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
