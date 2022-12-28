
import 'package:flutter/material.dart';
import 'package:vedio_call_audio_call/localization/app_localization.dart';

String getTranslated(String key, BuildContext context) {
  return AppLocalization.of(context)!.translate(key) ?? "";
}
