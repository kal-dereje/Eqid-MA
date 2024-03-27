import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBar({title, color}) {
  Get.snackbar(
    title,
    'This is the snackbar message',
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
    backgroundColor: color,
    colorText: Colors.white,
  );
}
