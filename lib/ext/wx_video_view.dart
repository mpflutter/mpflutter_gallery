import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_videoview/mpflutter_wechat_videoview.dart';

class WXVideoView extends StatefulWidget {
  const WXVideoView({super.key});

  @override
  State<WXVideoView> createState() => _WXVideoViewState();
}

class _WXVideoViewState extends State<WXVideoView> {
  final controller = MPFlutter_Wechat_VideoViewController();

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
            child: MPFlutter_Wechat_VideoView(
              controller: controller,
              src: "https://download.samplelib.com/mp4/sample-5s.mp4",
            ),
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
        ],
      ),
    );
  }
}
