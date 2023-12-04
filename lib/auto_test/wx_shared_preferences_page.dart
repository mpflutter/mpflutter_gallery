import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _caseTitle = "wx.sharedPreferences";

class WXSharedPreferencesTest extends StatefulWidget {
  const WXSharedPreferencesTest({super.key});

  @override
  State<WXSharedPreferencesTest> createState() =>
      _WXSharedPreferencesTestState();
}

class _WXSharedPreferencesTestState extends State<WXSharedPreferencesTest> {
  bool tested = false;
  bool passed = false;

  @override
  void initState() {
    super.initState();
    runTest();
  }

  void runTest() async {
    {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setInt('counter', 10);
      await prefs.setBool('repeat', true);
      await prefs.setDouble('decimal', 1.5);
      await prefs.setString('action', 'Start');
      await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
    }
    {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int? counter = prefs.getInt('counter');
      final bool? repeat = prefs.getBool('repeat');
      final double? decimal = prefs.getDouble('decimal');
      final String? action = prefs.getString('action');
      final List<String>? items = prefs.getStringList('items');
      if (counter == 10 &&
          repeat == true &&
          decimal == 1.5 &&
          action == "Start" &&
          items?[0] == "Earth") {
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
