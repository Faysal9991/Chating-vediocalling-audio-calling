import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vedio_call_audio_call/helper/animation/slideleft_toright.dart';
import 'package:vedio_call_audio_call/helper/animation/slideright_toleft.dart';
import 'package:vedio_call_audio_call/util/theme/app_colors.dart';

class Helper {
  static List<BoxShadow> softUiShadow = [
    BoxShadow(
      color: Colors.white,
      offset: Offset(-5, -5),
      spreadRadius: 1,
      blurRadius: 15,
    ),
    BoxShadow(
      color: Color(0XFF748CAC).withOpacity(.6),
      offset: Offset(5, 5),
      spreadRadius: 1,
      blurRadius: 15,
    ),
  ];

  static toScreen(context, screen) {
    Navigator.push(context, SlideRightToLeft(page: screen));
  }

  static toReplacementScreenSlideRightToLeft(context, screen) {
    Navigator.pushReplacement(context, SlideRightToLeft(page: screen));
  }

  static toReplacementScreenSlideLeftToRight(context, screen) {
    Navigator.pushReplacement(context, SlideLeftToRight(page: screen));
  }

  static toRemoveUntilScreen(context, screen) {
    Navigator.pushAndRemoveUntil(context, SlideRightToLeft(page: screen), (route) => false);
  }

  static onWillPop(context, screen) {
    Navigator.pushAndRemoveUntil(context, SlideRightToLeft(page: screen), (route) => false);
  }

  static showSnack(context, message, {color: colorPrimaryLight, duration = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message, style: const TextStyle(fontSize: 14)), backgroundColor: color, duration: Duration(seconds: duration)));
  }

  static circularProgress(context) {
    const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(colorPrimaryLight)));
  }

  static showLog(message) {
    log("APP SAYS: $message");
  }

  static boxDecoration(Color color, double radius) {
    BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
