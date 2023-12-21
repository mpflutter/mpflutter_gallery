import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_videoview/mpflutter_wechat_videoview.dart';

class WXVideoView extends StatefulWidget {
  const WXVideoView({super.key});

  @override
  State<WXVideoView> createState() => _WXVideoViewState();
}

class _WXVideoViewState extends State<WXVideoView> {
  final controller = MPFlutter_Wechat_VideoViewController();
  var src = "https://download.samplelib.com/mp4/sample-5s.mp4";
  var opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WXVideoView'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: Opacity(
              opacity: opacity,
              child: MPFlutter_Wechat_VideoView(
                controller: controller,
                src: src,
                danmuBtn: true,
                enableDanmu: true,
                danmuList: const [
                  {"text": '第 1s 出现的弹幕', "color": '#ff0000', "time": 1},
                  {"text": '第 3s 出现的弹幕', "color": '#ff00ff', "time": 3}
                ],
                onPause: (detail) {
                  print("paused");
                },
                onTimeUpdate: (detail) {
                  print("onTimeUpdate = " + detail["currentTime"]);
                },
              ),
            ),
          ),
          ListTile(
            title: const Text('Push Next'),
            onTap: () {
              Navigator.of(context).pushNamed("/ui_waterfall_view");
            },
          ),
          ListTile(
            title: const Text('Play'),
            onTap: () {
              controller.getVideoContext()?.play();
            },
          ),
          ListTile(
            title: const Text('Pause'),
            onTap: () {
              controller.getVideoContext()?.pause();
            },
          ),
          ListTile(
            title: const Text('Change src'),
            onTap: () {
              setState(() {
                src = "https://download.samplelib.com/mp4/sample-10s.mp4";
              });
            },
          ),
          ListTile(
            title: const Text('Change opcaity'),
            onTap: () {
              setState(() {
                opacity = 0.1;
              });
            },
          )
        ],
      ),
    );
  }
}
