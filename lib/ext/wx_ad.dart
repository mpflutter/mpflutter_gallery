import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_ad/mpflutter_wechat_ad_custom.dart';

class WXAd extends StatefulWidget {
  const WXAd({super.key});

  @override
  State<WXAd> createState() => _WXAdState();
}

class _WXAdState extends State<WXAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WXAd'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MPFlutter_Wechat_AdCustom(unitId: 'adunit-053ee783714f50b9'),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 88,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
