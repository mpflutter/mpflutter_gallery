import 'package:flutter/material.dart';
import 'package:mpflutter_gallery/auto_test/encode_image_page.dart';
import 'package:mpflutter_gallery/auto_test/wx_async_result.test.dart';
import 'package:mpflutter_gallery/auto_test/wx_dio.test.dart';
import 'package:mpflutter_gallery/auto_test/wx_getx_network.test.dart';
import 'package:mpflutter_gallery/auto_test/wx_http.test.dart';
import 'package:mpflutter_gallery/auto_test/wx_shared_preferences_page.dart';
import 'package:mpflutter_gallery/auto_test/wx_sync_result.test.dart';
import 'package:mpflutter_gallery/auto_test/big_text_page.dart';

class AutoTestPage extends StatefulWidget {
  const AutoTestPage({super.key});

  @override
  State<AutoTestPage> createState() => _AutoTestPageState();
}

class _AutoTestPageState extends State<AutoTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自动化测试'),
      ),
      body: ListView(
        children: const [
          WXSyncResultTest(),
          WXAsyncResultTest(),
          WXHttpTest(),
          WXDioTest(),
          WXGetxNetworkTest(),
          WXSharedPreferencesTest(),
          WXBigTextTest(),
          EncodeImageTest(),
        ],
      ),
    );
  }
}
