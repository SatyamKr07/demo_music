import 'package:demo/src/central/widgets/my_glassmorphic_container.dart';
import 'package:demo/src/central/widgets/my_switch.dart';
import 'package:demo/src/central/widgets/my_text.dart';
import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  const HomeTemperature({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyGlassMorphicContainer(
      start: 0.3,
      end: 0.1,
      child: Container(
        color: Colors.white,
        // width: Get.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyText(text: "Home\nTemperature", color: Colors.black),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    text: "23",
                    fontSize: 48,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: MyText(
                      text: "^C",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              MySwitch(isOn: true)
            ],
          ),
        ),
      ),
    );
  }
}
