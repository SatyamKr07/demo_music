import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  TextEditingController textCtrl = TextEditingController();
  Logger logger = Logger();
  String reversed = "";
  reverseText() {
    reversed = "";
    var chars = textCtrl.text.split('');
    logger.d(chars);
    for (int i = 0; i < textCtrl.text.length; i++) {
      String res = chars[textCtrl.text.length - 1 - i];
      logger.d('res $res');
      reversed = reversed + res;
      logger.d(reversed);
    }
    update(['REVERSED_TEXT']);
    textCtrl.text = "";
  }
}
