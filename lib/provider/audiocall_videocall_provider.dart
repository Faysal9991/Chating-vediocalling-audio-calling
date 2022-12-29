import 'dart:math';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vedio_call_audio_call/data/model/audio_vediocall.dart';
import 'package:vedio_call_audio_call/screens/massage/massage_screen.dart';
import 'package:wakelock/wakelock.dart';

class AudioVideoCallProvider with ChangeNotifier {
  int remoteUserId = 0;
  bool localUserJoined = false;
  bool isFront = false;
  bool reConnectingRemoteView = false;
  bool videoPaused = false;
  bool mutedAudio = false;
  bool mutedVideo = false;
  bool switchMainView = false;
  bool remoteJoined = false;
  String appId = "3f90194af40449e9856fd6bea63c9ca9";
  bool muted = false;
  late RtcEngine _engine;
  late String localCallId;
  UserModel? opponent;
  String channel = "Btalk1998";
  //Initialize All The Setup For Agora Video Call
  setIncomingCallId(int id) {
    // callId = id;
  }

  clear() {
    isFront = false;
    reConnectingRemoteView = false;
    videoPaused = false;
    mutedAudio = false;
    mutedVideo = false;
    switchMainView = false;
    remoteJoined = false;
    notifyListeners();
  }


  // String randomId() {
  //   const chars =
  //       'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  //   Random rnd = Random();
  //
  //   return String.fromCharCodes(Iterable.generate(
  //       25, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  // }
  //






  _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    await [Permission.microphone, Permission.camera].request();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  Future<void> initialize() async {
    if (appId.isEmpty) {
      return;
    } else {
      await _initAgoraRtcEngine();
      await _addAgoraEventHandlers();

      VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
      configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
      await _engine.setVideoEncoderConfiguration(configuration);
      await _engine.joinChannel(
          "007eJxTYNhtVdd1crFi5aoqQ8OD0afbCs9bta1ktJdZOa/d/mvDDBEFBuM0SwNDS5PENBMDExPLVEsLU7O0FLOk1EQz42TL5ETLbWtWJTcEMjL88LrCzMgAgSA+J4NTSGJOtqGlpQUDAwDr0CEj",
          channel,
          null,
          0);
      print("=====================>>>>>>>>>>>>>>>>>>  joined succesfully");
      notifyListeners();

    }
  }

  /// Add agora event handlers
  _addAgoraEventHandlers() {
    _engine!.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        // final info = 'onError:$code ${code.index}';
        // print(info);
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        // final info = 'onJoinChannel: $channel, uid: $uid';
        // print(info);
      },
      leaveChannel: (stats) {
        // print('onLeaveChannel');
      },
      userJoined: (uid, elapsed) {
        // final info = 'userJoined: $uid';
        remoteJoined = true;
        remoteUserId = uid;
        notifyListeners();
      },
      userOffline: (uid, elapsed) async {
        if (elapsed == UserOfflineReason.Dropped) {
          Wakelock.disable();
        } else {
          // final info = 'userOffline: $uid';
          remoteUserId = 0;
         notifyListeners();
          // _timerKey.currentState?.cancelTimer();
        }
      },
      firstRemoteVideoFrame: (uid, width, height, elapsed) {
        // final info = 'firstRemoteVideo: $uid ${width}x $height';
      },
      connectionStateChanged: (type, reason) async {
        // print('connectionStateChanged');
        if (type == ConnectionStateType.Connected) {
          reConnectingRemoteView = false;
          notifyListeners();
        } else if (type == ConnectionStateType.Reconnecting) {
          reConnectingRemoteView = true;
          notifyListeners();
        }
      },
      remoteVideoStats: (remoteVideoStats) {
        if (remoteVideoStats.receivedBitrate == 0) {
          videoPaused = true;
          notifyListeners();
        } else {
          videoPaused = false;
          notifyListeners();
        }
      },
    ));
  }
  void onCallEnd() {
    clear();
   _engine.leaveChannel();
    Get.offAll(() => Massage());
    notifyListeners();
  }


  void onToggleMute() {
    muted = !muted;
    _engine.muteLocalAudioStream(muted);
    notifyListeners();
  }

  void onToggleMuteVideo() {
    mutedVideo = !mutedVideo;
    _engine.muteLocalVideoStream(mutedVideo);
  }

  void onSwitchCamera() {
    _engine.switchCamera().then((value) => {}).catchError((err) {});
    notifyListeners();
  }

}
