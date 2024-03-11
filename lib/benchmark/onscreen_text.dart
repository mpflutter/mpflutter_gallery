import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mpflutter_gallery/benchmark/fps_counter.dart';

class OnScreenTextPage extends StatefulWidget {
  const OnScreenTextPage({super.key});

  @override
  State<OnScreenTextPage> createState() => _OnScreenTextPageState();
}

class _OnScreenTextPageState extends State<OnScreenTextPage> {
  int number = 1;

  @override
  void initState() {
    super.initState();
    RendererBinding.instance.addPersistentFrameCallback((timeStamp) {
      RendererBinding.instance.scheduleForcedFrame();
    });
  }

  void incrementNumber() {
    setState(() {
      number += 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FPSCounter(),
      ),
      body: Stack(
        children: List.generate(number, (index) => const UpdatingText()),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: incrementNumber,
        child: Text('Text Count = $number'),
      ),
    );
  }
}

class UpdatingText extends StatefulWidget {
  const UpdatingText({super.key});

  @override
  State createState() => _UpdatingTextState();
}

class _UpdatingTextState extends State<UpdatingText> {
  String text = 'Initial Text';
  double top = 0;
  double left = 0;

  @override
  void initState() {
    super.initState();
    // 每秒更新文本内容
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        text = 'Updated Text: ${DateTime.now()}';
        top++;
        left++;
        if (top > 300) {
          top = 0;
        }
        if (left > 300) {
          left = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
