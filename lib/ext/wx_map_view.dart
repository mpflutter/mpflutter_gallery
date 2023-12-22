import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_mapview/mpflutter_wechat_mapview.dart';

class WXMapView extends StatefulWidget {
  const WXMapView({super.key});

  @override
  State<WXMapView> createState() => _WXMapViewState();
}

class _WXMapViewState extends State<WXMapView> {
  final controller = MPFlutter_Wechat_MapViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WXVideoView'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 400,
            child: MPFlutter_Wechat_MapView(
              controller: controller,
              longitude: 113.347698,
              latitude: 23.100022,
            ),
          ),
          ListTile(
            title: const Text('Push Next'),
            onTap: () {
              Navigator.of(context).pushNamed("/ui_waterfall_view");
            },
          ),
        ],
      ),
    );
  }
}
