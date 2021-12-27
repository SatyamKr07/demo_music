import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  MySwitch({Key? key, this.isOn = false}) : super(key: key);
  bool isOn;
  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      // onChanged: ,
      value: widget.isOn,
      activeColor: Colors.white,
      activeTrackColor: Colors.orange,
      inactiveThumbColor: Colors.white54,
      inactiveTrackColor: Colors.grey[300],
      onChanged: (bool value) {
        setState(() {
          widget.isOn = value;
        });
      },
    );
  }
}
