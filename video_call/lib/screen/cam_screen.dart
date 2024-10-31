import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:video_call/const/keys.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine;

  int uid = 0;
  int? remoteUid;

  Future<void> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final camerPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if (camerPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted) {
      throw ' 카메라 또는 마이크 권한이 없습니다.';
    }

    if (engine == null) {
      engine = createAgoraRtcEngine();
      await engine!.initialize(
        RtcEngineContext(appId: appid),
      );

      engine!.registerEventHandler(
        RtcEngineEventHandler(
          //우리가 채널을 들어왔을때 실행되는 함수
          onJoinChannelSuccess: (
            RtcConnection connection,
            int elapsed,
          ) {},
          //우리가 채널을 나갔을때 실행되는 함수
          onLeaveChannel: (
            RtcConnection connection,
            RtcStats stats,
          ) {},
          //상대가 들어왔을때 실행되는 함수
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            print('---User joined---');
            setState(() {
              this.remoteUid = remoteUid;
            });
          },
          //상대가 나갔을때 실행되는 함수
          onUserOffline: (
            RtcConnection connection,
            int remoteUid,
            UserOfflineReasonType reason,
          ) {
            setState(() {
              this.remoteUid = null;
            });
          },
        ),
      );

      await engine!.enableVideo();
      await engine!.startPreview();

      ChannelMediaOptions options = ChannelMediaOptions();

      await engine!.joinChannel(
        token: token,
        channelId: channelName,
        uid: uid,
        options: options,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIVE'),
      ),
      body: FutureBuilder<void>(
          future: init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return Stack(
              children: [
                Container(
                  child: renderMainView(),
                ),
                Container(
                  width: 120,
                  height: 160,
                  child: AgoraVideoView(
                    controller: VideoViewController(
                      rtcEngine: engine!,
                      canvas: VideoCanvas(
                        uid: uid,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      engine!. leaveChannel();// 채널을 나가고
                      engine!.release(); //채널을 삭제하고
                      Navigator.of(context).pop(); //pop을 해서 뒤로 나가다.
                    },
                    child: Text('나가기'),
                  ),
                ),
              ],
            );
          }),
    );
  }

  renderMainView() {
    if (remoteUid == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: engine!,
        canvas: VideoCanvas(
          uid: remoteUid,
        ),
        connection: RtcConnection(
          channelId: channelName,
        ),
      ),
    );
  }
}
