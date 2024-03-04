// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:mpflutter_gallery/ui/form_app/src/form_widgets_mp.dart';

import 'src/autofill.dart';
import 'src/form_widgets.dart';
import 'src/http/mock_client.dart';
import 'src/sign_in_http.dart';
import 'src/validation.dart';

export 'src/autofill.dart';
export 'src/form_widgets.dart';
export 'src/form_widgets_mp.dart';
export 'src/http/mock_client.dart';
export 'src/sign_in_http.dart';
export 'src/validation.dart';

const double windowWidth = 480;
const double windowHeight = 854;

void setupWindow() {}

final demos = [
  Demo(
    name: 'Sign in with HTTP',
    route: 'signin_http',
    builder: (context) => SignInHttpDemo(
      // This sample uses a mock HTTP client.
      httpClient: mockClient,
    ),
  ),
  Demo(
    name: 'Autofill',
    route: 'autofill',
    builder: (context) => const AutofillDemo(),
  ),
  Demo(
    name: 'Form widgets',
    route: 'form_widgets',
    builder: (context) => const FormWidgetsDemo(),
  ),
  Demo(
    name: 'Form widgets MP',
    route: 'form_widgets_mp',
    builder: (context) => const FormWidgetsMPDemo(),
  ),
  Demo(
    name: 'Validation',
    route: 'validation',
    builder: (context) => const FormValidationDemo(),
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Samples'),
      ),
      body: ListView(
        children: [...demos.map((d) => DemoTile(demo: d))],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo? demo;

  const DemoTile({this.demo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo!.name),
      onTap: () {
        Navigator.of(context).pushNamed('/form_app/${demo!.route}');
      },
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({required this.name, required this.route, required this.builder});
}
