import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/src/central/widgets/my_glassmorphic_container.dart';
import 'package:demo/src/central/widgets/my_switch.dart';
import 'package:demo/src/central/widgets/my_text.dart';
import 'package:demo/src/controllers/home_controller.dart';
import 'package:demo/src/pages/home/views/electricity_usuage.dart';
import 'package:demo/src/pages/home/views/my_music_player.dart';
import 'package:demo/src/pages/home/views/smart_tv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home_temperature.dart';
import 'views/plug_wall.dart';

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              "https://images.unsplash.com/photo-1616593918824-4fef16054381?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGhvbWUlMjBkZWNvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
              //  "https://images.unsplash.com/photo-1616046386594-c152babc9e15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fGhvbWUlMjBkZWNvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(text: "Good Morning"),
                        const SizedBox(height: 4),
                        MyText(
                          text: "Chris Chooper",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  const MyGlassMorphicContainer(
                    start: 0.3,
                    end: 0.1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              MyText(text: "Living Room"),
              const SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Expanded(
                    child: HomeTemperature(),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: PlugWall(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: MyMusicPlayer()),
                  SizedBox(width: 20),
                  Expanded(child: SmartTv()),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(text: "Statistics"),
                  MyText(text: "Month"),
                ],
              ),
              const SizedBox(height: 20.0),
              ElectricityUsuage(),
            ],
          ),
        ),
      ),
    );
  }
}
