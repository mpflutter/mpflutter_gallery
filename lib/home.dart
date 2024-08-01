import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpflutter_core/mpflutter_core.dart';
import 'package:mpflutter_gallery/common.dart';

final examples = {
  "MPFlutter Auto Test": "/auto_test",
  "无限长 ListView": "/ui_infinite_listview",
  "瀑布流 WaterfallView": "/ui_waterfall_view",
  "图片列表 Grid Image": "/ui_grid_image",
  "MiniTexTest": "/ui_minitex",
  "Animation One Page": "/animation_one_page",
  "图表 fl_chart": "/flchart_page",
  "Simple Shader": "/simple_shader_page",
  "Form App": "/form_app/home",
  "Ext - WXVideoView": "/ext/wx_video_view",
  "Ext - WXButton": "/ext/wx_button",
  "Ext - WXMapView": "/ext/wx_map_view",
  "Ext - WXWebView": "/ext/wx_web_view",
  "Ext - WXImage": "/ext/wx_image",
  "Ext - WXAd": "/ext/wx_ad",
  "AudioPlayer": "/audioplayer",
  "Benchmark": "/benchmark",
};
final exampleKeys = examples.keys.toList();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MPFlutterWechatAppDelegate appDelegate;

  @override
  void initState() {
    super.initState();
    appDelegate = MPFlutterWechatAppDelegate(
      onLaunch: _onLaunchEnter,
      onEnter: _onLaunchEnter,
      onShow: () {
        print("onshow");
      },
      onHide: () {
        print("onhide");
      },
      onShareAppMessage: (detail) {
        return MPFlutterWechatAppShareManager.onShareAppMessage(detail);
      },
      // onShareAppMessageAsync: (detail, callback) async {
      //   await Future.delayed(const Duration(milliseconds: 1500));
      //   callback({
      //     "title": "delay",
      //     "path": "pages/index/index",
      //   });
      // },
      onShareTimeline: (detail) {
        return MPFlutterWechatAppShareManager.onShareTimeline(detail);
      },
      onAddToFavorites: (detail) {
        return MPFlutterWechatAppShareManager.onAddToFavorites(detail);
      },
      onSaveExitState: () {
        return {
          "data": {"fooKey": "fooValue of exitState"},
          "expireTimeStamp": DateTime.now().millisecond + 24 * 60 * 60 * 1000
        };
      },
    );
  }

  void _onLaunchEnter(query, options) {
    final isSinglePage = options["scene"] == 1154;
    if (isSinglePage) {
      AppParams.isSinglePage = true;
      if (query.isNotEmpty) {
        if (query["routeName"] == "/ui_infinite_listview") {
          Navigator.of(context).pushReplacementNamed("/ui_infinite_listview");
        }
      }
    } else {
      if (query.isNotEmpty) {
        if (query["routeName"] == "/ui_infinite_listview") {
          Navigator.of(context).pushNamed("/ui_infinite_listview");
        }
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MPFlutterWechatAppShareManager.setAppShareInfo(
      context: context,
      title: 'MPFlutter 小程序示例',
      query: {
        'routeName': '/',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MPFlutter 小程序示例',
          // style: TextStyle(fontFamily: "XXXX"),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(examples[exampleKeys[index]]!);
            },
            title: Text(
              exampleKeys[index],
            ),
            trailing: Transform.translate(
              offset: const Offset(10.0, 0.0),
              child: const Icon(
                CupertinoIcons.right_chevron,
                color: Colors.black,
                size: 12,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black.withAlpha(32),
            indent: 16,
            endIndent: 16,
          );
        },
        itemCount: exampleKeys.length,
      ),
    );
  }
}
