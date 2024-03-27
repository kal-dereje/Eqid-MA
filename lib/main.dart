import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/screens/firstpage.dart';

void main() {
  runApp(const SafeArea(
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    ),
  ));
}
