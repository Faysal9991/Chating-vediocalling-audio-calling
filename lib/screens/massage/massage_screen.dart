import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:vedio_call_audio_call/provider/audiocall_videocall_provider.dart';
import 'package:vedio_call_audio_call/screens/audio_vedioCall/video_call.dart';
import 'package:vedio_call_audio_call/util/helper.dart';
import 'package:vedio_call_audio_call/util/theme/text.styles.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RTCRemoteView;

class Massage extends StatelessWidget {
  const Massage({Key? key}) : super(key: key);

  @override

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        body: SafeArea(
          child: Column(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: const Color(0XffCDDEEC),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    boxShadow: Helper.softUiShadow),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: Helper.softUiShadow),
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 15,
                                )),
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: Helper.softUiShadow),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.menu_outlined,
                                  size: 15,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: Helper.softUiShadow,
                                image: const DecorationImage(
                                    image: AssetImage("assets/background/profile.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Israt Jahan Tuli",
                                  style: latoStyle800ExtraBold,
                                ),
                                Text(
                                  "Online",
                                  style: latoStyle600SemiBold.copyWith(color: Colors.green),
                                ),
                                Text(
                                  "I am an indipendent girl...",
                                  style: latoStyle500Medium.copyWith(color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: const Color(0xffF7F7F7),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                        Get.to(VideoCallScreen());
                                        },
                                        icon: const Icon(
                                          Icons.call,
                                          color: Colors.green,
                                        )))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: const Color(0xffF7F7F7),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.search,
                                          color: Colors.green,
                                        )))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                  boxShadow: Helper.softUiShadow),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Hey,this is Tuli..",
                                  style: latoStyle400Regular,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: Helper.softUiShadow,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file)),
                    Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                          color: const Color(0xffF7F7F7), borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 2),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Message",
                            hintStyle: latoStyle500Medium.copyWith(color: Colors.black45),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_voice_outlined)),
                  ],
                ),
              ),
            ]
          )

        ));
  }
}
