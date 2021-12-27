import 'package:demo/src/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => Home());
              },
              child: Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
