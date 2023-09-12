import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:queing_display/config/app_config.dart';

//Convert url to Uri
String getUrl(String url) {
  return ('$baseUrl$url');
}

void showMessageError(
    {String title = 'Error Message',
    required String message,
    Color color = Colors.red,
    SnackPosition position = SnackPosition.TOP}) {
  Get.snackbar(title, message, backgroundColor: color, snackPosition: position);
}
