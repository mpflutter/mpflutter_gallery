import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_videoview/mpflutter_wechat_videoview.dart';

class WXVideoView extends StatefulWidget {
  const WXVideoView({super.key});

  @override
  State<WXVideoView> createState() => _WXVideoViewState();
}

class _WXVideoViewState extends State<WXVideoView> {
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
              src: "https://download.samplelib.com/mp4/sample-5s.mp4",
            ),
          ),
          ListTile(title: Text('src: sample-5s')),
          ListTile(title: Text('src: sample-5s')),
          ListTile(title: Text('src: sample-5s')),
          ListTile(title: Text('src: sample-5s')),
          ListTile(title: Text('src: sample-5s')),
          ListTile(title: Text('src: sample-5s')),
        ],
      ),
    );
  }
}
