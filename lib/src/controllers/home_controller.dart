import 'package:audioplayers/audioplayers.dart' hide Logger;
import 'package:demo/src/models/music_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  List<MusicModel> musicModelList = [];
  late AudioPlayer audioplayer;
  bool Playingbutton = false;
  int currentPlayingIndex = 0;
  final logger = Logger();
  AudioCache audioCache = AudioCache();
  String? localAudioCacheURI;

  handleMusic() async {
    if (Playingbutton == false) {
      var result = await audioplayer.play(
        musicModelList[currentPlayingIndex].musicUrl,
      );

      Get.snackbar(
        "Playing music",
        "Have patience. Music being played from internet",
      );
      // setState(() {
      Playingbutton = true;
      update(['PLAY_BTN']);
      // });
    } else {
      var r = await audioplayer.pause();
      // logger.d(r);
      // Get.snackbar("Playing paused", "");
      // setState(() {
      Playingbutton = false;
      update(['PLAY_BTN']);

      // });
    }
  }

  handleNext() async {
    if (currentPlayingIndex != musicModelList.length - 1) {
      audioplayer.stop();
      currentPlayingIndex += 1;
      var result = await audioplayer.play(
        musicModelList[currentPlayingIndex].musicUrl,
      );
      logger.d('next res $result');
      Get.snackbar(
        "Playing music",
        "Have patience. Music being played from internet",
      );
    } else {
      audioplayer.stop();
      await audioplayer.play(musicModelList[currentPlayingIndex].musicUrl);
      // Get.snackbar(
      //   "Opps!",
      //   "NO more music available",
      // );
    }

    // setState(() {
    Playingbutton = true;
    update(['PLAY_BTN']);
    // });
  }

  handlePrevious() async {
    if (currentPlayingIndex != 0) {
      audioplayer.stop();
      currentPlayingIndex -= 1;
      var result = await audioplayer.play(
        musicModelList[currentPlayingIndex].musicUrl,
      );
      logger.d('next res $result');
      Get.snackbar(
        "Playing music",
        "Have patience. Music being played from internet",
      );
    } else {
      audioplayer.stop();
      await audioplayer.play(musicModelList[currentPlayingIndex].musicUrl);
      // Get.snackbar(
      //   "Opps!",
      //   "NO more music available",
      // );
    }

    // setState(() {
    Playingbutton = true;
    update(['PLAY_BTN']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    audioplayer = AudioPlayer();
    musicModelList.add(
      MusicModel(
          musicUrl: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
          imgUrl: "",
          musicName: "music 1"),
    );
    musicModelList.add(
      MusicModel(
        musicUrl: "https://luan.xyz/files/audio/ambient_c_motion.mp3",
        imgUrl: "",
        musicName: "music 2",
      ),
    );
  }
}
