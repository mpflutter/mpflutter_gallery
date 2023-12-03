import 'package:flutter/material.dart';
import 'package:wechat_miniprogram_api_mpflutter/wechat_miniprogram_api_mpflutter.dart';

const _caseTitle = "wx.getSystemInfoAsync";

class WXAsyncResultTest extends StatefulWidget {
  const WXAsyncResultTest({super.key});

  @override
  State<WXAsyncResultTest> createState() => _WXAsyncResultTestState();
}

class _WXAsyncResultTestState extends State<WXAsyncResultTest> {
  bool tested = false;
  bool passed = false;

  @override
  void initState() {
    super.initState();
    runTest();
  }

  void runTest() {
    wx.getSystemInfoAsync(GetSystemInfoAsyncOption()
      ..success = (result) {
        if (result.model.isNotEmpty && result.pixelRatio > 0) {
          setState(() {
            tested = true;
            passed = true;
          });
        } else {
          setState(() {
            tested = true;
            passed = false;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    if (!tested) {
      return const ListTile(
        title: Text(_caseTitle),
        trailing: SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(),
        ),
      );
    }
    return ListTile(
      title: const Text(_caseTitle),
      trailing: passed
          ? const Icon(
              Icons.check,
              color: Colors.green,
            )
          : const Icon(
              Icons.close,
              color: Colors.red,
            ),
    );
  }
}
