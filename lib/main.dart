


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';
import 'package:vedio_call_audio_call/provider/audiocall_videocall_provider.dart';
import 'package:vedio_call_audio_call/provider/language_provider.dart';
import 'package:vedio_call_audio_call/provider/nevigation_provider.dart';
import 'package:vedio_call_audio_call/screens/nevigation_bar/nevigationbar.dart';
import 'di_container.dart' as di;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Color(0XffCDDEEC), // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<LanguageProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<NevigationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AudioVideoCallProvider>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Feedback',
        theme: ThemeData(
        primaryColor: Colors.grey[800],),
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
      home: const NevigationScreen(),
    );
  }
}