import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_webview/mpflutter_wechat_webview.dart';

class WXWebView extends StatefulWidget {
  const WXWebView({super.key});

  @override
  State<WXWebView> createState() => _WXWebViewState();
}

class _WXWebViewState extends State<WXWebView> {
  String? pvid;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      if (pvid != null) {
        MPFlutter_Wechat_WebView.close(pvid!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WXWebView'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            pvid = MPFlutter_Wechat_WebView.open(
              "https://www.github.com/",
              onLoad: (_) {
                print("webview loaded");
              },
            );
          },
          child: const Text('Open WebView'),
        ),
      ),
    );
  }
}
