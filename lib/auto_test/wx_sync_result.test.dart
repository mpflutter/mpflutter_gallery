import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_api/mpflutter_wechat_api.dart';

const _caseTitle = "wx.getSystemInfoSync";

class WXSyncResultTest extends StatefulWidget {
  const WXSyncResultTest({super.key});

  @override
  State<WXSyncResultTest> createState() => _WXSyncResultTestState();
}

class _WXSyncResultTestState extends State<WXSyncResultTest> {
  bool tested = false;
  bool passed = false;

  @override
  void initState() {
    super.initState();
    runTest();
  }

  void runTest() {
    final result = wx.getSystemInfoSync();
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
