import 'package:demo/src/central/widgets/my_glassmorphic_container.dart';
import 'package:demo/src/central/widgets/my_switch.dart';
import 'package:demo/src/central/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SmartTv extends StatelessWidget {
  const SmartTv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyGlassMorphicContainer(
      start: 0.3,
      end: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MyText(
                    text: "Smart Tv",
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 12,
                )
              ],
            ),
            const SizedBox(height: 16.0),
            MyText(
              text: "Samsung UA55 4AC",
              fontSize: 14,
            ),
            MySwitch()
          ],
        ),
      ),
    );
  }

  Row myList({required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.circle, color: Colors.white, size: 8),
        SizedBox(width: 8.0),
        Expanded(
          child: MyText(
            text: text,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
