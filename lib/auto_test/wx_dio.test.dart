import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

const _caseTitle = "wx.dio";

class WXDioTest extends StatefulWidget {
  const WXDioTest({super.key});

  @override
  State<WXDioTest> createState() => _WXDioTestState();
}

class _WXDioTestState extends State<WXDioTest> {
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
    try {
      await runGetTest();
      await runPostTest();
      await runPostJsonTest();
      setState(() {
        tested = true;
        passed = true;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
      setState(() {
        tested = true;
        passed = false;
      });
    }
  }

  Future runGetTest() async {
    final response = await Dio().get("https://httpbin.org/get");
    final bodyData = response.data;
    if (!(bodyData is Map && bodyData['url'] == "https://httpbin.org/get")) {
      throw 'WXHttpTest, runGetTest, failed.';
    }
  }

  Future runPostTest() async {
    final response = await Dio().post(
      "https://httpbin.org/post",
      data: "Hello, World!",
    );
    final bodyData = response.data;
    if (!(bodyData is Map && bodyData['data'] == "Hello, World!")) {
      throw 'WXHttpTest, runPostTest, failed.';
    }
  }

  Future runPostJsonTest() async {
    final response = await Dio().post(
      "https://httpbin.org/post",
      data: {"a": "b"},
      options: Options(contentType: "application/json"),
    );
    final bodyData = response.data;
    if (!(bodyData is Map && bodyData['json']['a'] == 'b')) {
      throw 'WXHttpTest, runPostJsonTest, failed.';
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
