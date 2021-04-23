import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Music Player');
    setWindowMinSize(const Size(1000, 1060));
    setWindowMaxSize(Size(2000, 1100));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          Player player = await Player.create(id: 69420);
          final myDir = Directory('/home/wildone/Music');
          print(myDir.path);
          player.open(
            new Playlist(
              medias: [
                await Media.file(
                  new File(myDir.path),
                ),
              ],
            ),
          );
          player.play();
          // print(media);
          // AudioManager.instance.start("${directory.path}", "Testing").then((value) => print(value));
        },
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
