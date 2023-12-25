import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpflutter_wechat_api/mpflutter_wechat_api.dart';

const _caseTitle = "BigText rootBundle";

class WXBigTextTest extends StatefulWidget {
  const WXBigTextTest({super.key});

  @override
  State<WXBigTextTest> createState() => _WXBigTextTestState();
}

class _WXBigTextTestState extends State<WXBigTextTest> {
  bool tested = false;
  bool passed = false;

  @override
  void initState() {
    super.initState();
    try {
      runTest();
    } catch (e) {
      print(e);
    }
  }

  void runTest() async {
    final result = await rootBundle.loadString("assets/big_text.txt");
    if (result.isNotEmpty) {
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
