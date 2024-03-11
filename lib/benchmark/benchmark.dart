import 'package:flutter/material.dart';

import 'onscreen_text.dart';

class BenchmarkPage extends StatelessWidget {
  const BenchmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Benchmark"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("On Screen Texts"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const OnScreenTextPage();
              }));
            },
          )
        ],
      ),
    );
  }
}
