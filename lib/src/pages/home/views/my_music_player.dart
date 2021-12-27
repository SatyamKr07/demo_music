import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart' hide Logger;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/src/central/widgets/my_glassmorphic_container.dart';
import 'package:demo/src/central/widgets/my_text.dart';
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
        child: GetBuilder<HomeController>(
          id: "MUSIC_PLAYER",
          builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                      child: ClipRect(
                        child: CachedNetworkImage(
                          imageUrl: homeController
                              .musicModelList[
                                  homeController.currentPlayingIndex]
                              .imgUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                          height: 35,
                          width: 35,
                        ),
                      )),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: MyText(
                          text: homeController
                              .musicModelList[
                                  homeController.currentPlayingIndex]
                              .musicName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: MyText(
                          text: homeController
                              .musicModelList[
                                  homeController.currentPlayingIndex]
                              .artistName,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                  MyGlassMorphicContainer(
                    start: 0.3,
                    end: 0.1,
                    child: IconButton(
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
                ],
              ),
              SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
