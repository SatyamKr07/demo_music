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

  handleMusic() async {
    if (Playingbutton == false) {
      var result = await audioplayer.play(
        musicModelList[currentPlayingIndex].musicUrl,
      );

      Get.snackbar(
        "Playing music",
        "Have patience. Music being played from internet",
      );
      Playingbutton = true;
      update(['MUSIC_PLAYER']);
    } else {
      var r = await audioplayer.pause();

      Playingbutton = false;
      update(['MUSIC_PLAYER']);
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
    update(['MUSIC_PLAYER']);
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
    update(['MUSIC_PLAYER']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    audioplayer = AudioPlayer();
    musicModelList.add(
      MusicModel(
          musicUrl: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
          imgUrl:
              "https://9b16f79ca967fd0708d1-2713572fef44aa49ec323e813b06d2d9.ssl.cf2.rackcdn.com/1140x_a10-7_cTC/NS-WKMAG0730-1595944356.jpg",
          musicName: "music 1",
          artistName: 'Artist 1'),
    );
    musicModelList.add(
      MusicModel(
        musicUrl: "https://luan.xyz/files/audio/ambient_c_motion.mp3",
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCmYtDE48C_V_awTsAL_u1-_O7_IkD94GC7KT3h84LdeqOG2U6ABbBTwPxl5vvm5MiHn0&usqp=CAU",
        musicName: "music 2",
        artistName: 'Artist 2',
      ),
    );
  }
}
