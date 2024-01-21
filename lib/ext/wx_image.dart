import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_image/mpflutter_wechat_image.dart';

class WXImage extends StatefulWidget {
  const WXImage({super.key});

  @override
  State<WXImage> createState() => _WXImageState();
}

class _WXImageState extends State<WXImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WXImage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 407,
              child: MPFlutter_Wechat_Image(
                src: "https://dist.mpflutter.com/IMG_0070.JPG",
                showMenuByLongpress: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
