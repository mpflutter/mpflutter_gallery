// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:mpflutter_core/mpflutter_core.dart';

part 'sign_in_http.g.dart';

@JsonSerializable()
class FormData {
  String? email;
  String? password;

  FormData({
    this.email,
    this.password,
  });

  factory FormData.fromJson(Map<String, dynamic> json) =>
      _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDataToJson(this);
}

class SignInHttpDemo extends StatefulWidget {
  final http.Client? httpClient;

  const SignInHttpDemo({
    this.httpClient,
    super.key,
  });

  @override
  State<SignInHttpDemo> createState() => _SignInHttpDemoState();
}

class _SignInHttpDemoState extends State<SignInHttpDemo> {
  FormData formData = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in Form'),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).viewInsets.bottom,
        curve: Curves.ease,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...[
              TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: '电话号码',
                  labelText: '电话号码',
                ),
                onChanged: (value) {
                  formData.email = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (value) {
                  formData.password = value;
                },
              ),
              TextButton(
                child: const Text('Sign in'),
                onPressed: () async {
                  // Use a JSON encoded string to send
                  var result = await widget.httpClient!.post(
                      Uri.parse('https://example.com/signin'),
                      body: json.encode(formData.toJson()),
                      headers: {'content-type': 'application/json'});

                  _showDialog(switch (result.statusCode) {
                    200 => 'Successfully signed in.',
                    401 => 'Unable to sign in.',
                    _ => 'Something went wrong. Please try again.'
                  });
                },
              ),
            ]
          ],
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
