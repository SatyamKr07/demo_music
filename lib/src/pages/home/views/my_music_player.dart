import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart' hide Logger;
import 'package:demo/src/central/widgets/my_glassmorphic_container.dart';
import 'package:demo/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class MyMusicPlayer extends StatefulWidget {
  @override
  _MyMusicPlayerState createState() => _MyMusicPlayerState();
}

class _MyMusicPlayerState extends State<MyMusicPlayer> {
  final logger = Logger();
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: MyGlassMorphicContainer(
        start: 0.1,
        end: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  // width: double.infinity,
                  child: IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      homeController.handlePrevious();
                    },
                  ),
                ),
                // SizedBox(
                //   width: 5,
                // ),
                Container(
                  // width: double.infinity,
                  child: GetBuilder<HomeController>(
                    id: "PLAY_BTN",
                    builder: (_) {
                      return IconButton(
                        icon: Icon(
                          homeController.Playingbutton
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 24,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          logger.d('Play');
                          homeController.handleMusic();
                        },
                      );
                    },
                  ),
                ),
                // SizedBox(
                //   width: 5,
                // ),
                Container(
                  // width: double.infinity,
                  child: IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      logger.d('Forward');
                      homeController.handleNext();
                    },
                  ),
                ),
                // SizedBox(
                //   width: 5,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
