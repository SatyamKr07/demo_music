import 'dart:io';

import 'package:audioplayers/audioplayers.dart' hide Logger;
import 'package:demo/src/central/widgets/my_glassmorphic_container.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class MyMusicPlayer extends StatefulWidget {
  @override
  _MyMusicPlayerState createState() => _MyMusicPlayerState();
}

class _MyMusicPlayerState extends State<MyMusicPlayer> {
  bool Playingbutton = false;
  late AudioPlayer audioplayer;
  final logger = Logger();
  @override
  void initState() {
    super.initState();
    audioplayer = AudioPlayer();
  }

  mytoast(var message) {
    // Fluttertoast.showToast(
    //     msg: message,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.purple.shade100,
    //     textColor: Colors.purple.shade900,
    //     fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return MyGlassMorphicContainer(
      start: 0.1,
      end: 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                // width: double.infinity,
                child: IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    size: 45,
                    color: Colors.purple.shade500,
                  ),
                  onPressed: () {
                    logger.d('Rewind');
                    mytoast("Currently unavailable");
                  },
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                // width: double.infinity,
                child: IconButton(
                  icon: Icon(
                    Playingbutton ? Icons.pause : Icons.play_arrow,
                    size: 45,
                    color: Colors.purple.shade500,
                  ),
                  onPressed: () async {
                    logger.d('Play');

                    if (Playingbutton == false) {
                      // final file = File(
                      //     '${(await getTemporaryDirectory()).path}/music.mp3');
                      // await file.writeAsBytes(
                      //     (await loadAsset()).buffer.asUint8List());
                      var result = await audioplayer.play(
                          'https://raw.githubusercontent.com/22suraj/Music_Player/master/Main_Tumhara.mp3');
                      // var result = await audioplayer
                      //     .play('assets/music/Main_Tumhara.mp3', isLocal: true);
                      logger.d(result);
                      mytoast("Music played");
                      setState(() {
                        Playingbutton = true;
                      });
                    } else {
                      var r = await audioplayer.pause();
                      logger.d(r);
                      mytoast("Music paused");
                      setState(() {
                        Playingbutton = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                // width: double.infinity,
                child: IconButton(
                  icon: Icon(
                    Icons.skip_next,
                    size: 45,
                    color: Colors.purple.shade500,
                  ),
                  onPressed: () {
                    logger.d('Forward');
                    mytoast("Currently unavailable");
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
