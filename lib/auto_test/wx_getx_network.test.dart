import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

const _caseTitle = "WXGetxNetworkTest";

class WXGetxNetworkTest extends StatefulWidget {
  const WXGetxNetworkTest({super.key});

  @override
  State<WXGetxNetworkTest> createState() => _WXGetxNetworkTestState();
}

class _WXGetxNetworkTestState extends State<WXGetxNetworkTest> {
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
    final connect = GetConnect();
    final response = await connect.request("https://httpbin.org/get", "GET");
    final bodyData = response.body;
    if (!(bodyData is Map && bodyData['url'] == "https://httpbin.org/get")) {
      throw 'WXHttpTest, runGetTest, failed.';
    }
  }

  Future runPostTest() async {
    final connect = GetConnect();
    final response = await connect.request(
      "https://httpbin.org/post",
      "POST",
      body: "Hello, World!",
    );
    final bodyData = response.body;
    if (!(bodyData is Map && bodyData['data'] == "Hello, World!")) {
      throw 'WXHttpTest, runPostTest, failed.';
    }
  }

  Future runPostJsonTest() async {
    final connect = GetConnect();
    final response = await connect.request(
      "https://httpbin.org/post",
      "POST",
      body: {"a": "b"},
      headers: {"content-type": "application/json"},
    );
    final bodyData = response.body;
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
