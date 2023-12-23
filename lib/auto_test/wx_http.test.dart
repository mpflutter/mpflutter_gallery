import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _caseTitle = "wx.http";

class WXHttpTest extends StatefulWidget {
  const WXHttpTest({super.key});

  @override
  State<WXHttpTest> createState() => _WXHttpTestState();
}

class _WXHttpTestState extends State<WXHttpTest> {
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
    final response = await http.get(Uri.parse("https://httpbin.org/get"));
    final bodyData = json.decode(response.body);
    if (!(bodyData is Map && bodyData['url'] == "https://httpbin.org/get")) {
      throw 'WXHttpTest, runGetTest, failed.';
    }
  }

  Future runPostTest() async {
    final response = await http.post(
      Uri.parse("https://httpbin.org/post"),
      body: "Hello, World!",
    );
    final bodyData = json.decode(response.body);
    if (!(bodyData is Map && bodyData['data'] == "Hello, World!")) {
      throw 'WXHttpTest, runPostTest, failed.';
    }
  }

  Future runPostJsonTest() async {
    final response = await http.post(
      Uri.parse("https://httpbin.org/post"),
      body: json.encode({"a": "b"}),
      headers: {"content-type": "application/json"},
    );
    final bodyData = json.decode(response.body);
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
