

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vedio_call_audio_call/provider/audiocall_videocall_provider.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  void initState() {
    // TODO: implement initState
    Provider.of<AudioVideoCallProvider>(context, listen: false).initialize();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AudioVideoCallProvider>(

        builder: (context, callProvider,child) {
          return Stack(
            children: [
          AgoraVideoViewer(
          client: AgoraClient(
          agoraConnectionData: AgoraConnectionData(
              appId: callProvider.appId,
              channelName: callProvider.channel)),
    layoutType: Layout.floating,
    enableHostControls: true,
    ),
    AgoraVideoButtons(
    client: AgoraClient(agoraConnectionData: AgoraConnectionData(
    appId: callProvider.appId,
    channelName: callProvider.channel)),
    )
            ],
          );
        }
      ),
    );
  }
}
