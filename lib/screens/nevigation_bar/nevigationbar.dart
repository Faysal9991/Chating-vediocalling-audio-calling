import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:vedio_call_audio_call/provider/nevigation_provider.dart';
import 'package:vedio_call_audio_call/screens/chat/chat_screen.dart';
import 'package:vedio_call_audio_call/util/theme/app_colors.dart';
import 'package:vedio_call_audio_call/util/theme/text.styles.dart';

class NevigationScreen extends StatelessWidget {
  const NevigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NevigationProvider>(

        builder: (context,nevigationProvider,child) {
      return nevigationProvider.selectedIndex==0?const ChatScreen():Text("hello");
        }),
 bottomNavigationBar: Padding(
   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
   child: Consumer<NevigationProvider>(

     builder: (context,nevigationProvider,child) {
       return GNav(
         rippleColor: Colors.grey[300]!,
         hoverColor: Colors.grey[100]!,
         gap: 8,
         activeColor: Colors.black,
         iconSize: 24,
         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
         duration: const Duration(milliseconds: 400),
         tabBackgroundColor: Colors.grey[100]!,
         color: Colors.black,
         tabs: [
           GButton(
             icon: LineIcons.facebookMessenger,
             text: 'Message',
             textStyle: latoStyle300Light,
             iconActiveColor: AppColors.iconColor,
             iconColor: Colors.grey,
           ),
            GButton(
             icon: CupertinoIcons.camera,
             text: 'video',
             textStyle: latoStyle300Light,
             iconActiveColor: AppColors.iconColor,
             iconColor: AppColors.grey,
           ),
            GButton(
             icon: LineIcons.phone,
             text: 'Call',
             textStyle: latoStyle300Light,
             iconActiveColor: AppColors.iconColor,
             iconColor: AppColors.grey,
           ),
            GButton(
              icon: CupertinoIcons.person,
              text: 'profile',
             textStyle: latoStyle300Light,
             iconActiveColor: AppColors.iconColor,
             iconColor: AppColors.grey,
           ),
         ],
         selectedIndex: nevigationProvider.selectedIndex,
         onTabChange: (index) {
           nevigationProvider.changeSelectedIndex(index);
           });
         },)));

  }
}
