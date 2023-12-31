///
/// Created by NieBin on 2019/1/9
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'package:mpflutter_gallery/ui/flutter_animations/constant/_constant.dart';
import 'dart:math';

///tutorial: https://medium.com/flutteropen/animation-01-how-to-use-the-animation-in-the-flutter-e3ef7043f940
class AnimationOnePage extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<AnimationOnePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = Tween(begin: 50.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          print("complete");
        }
      });
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Tutorial 01"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              alignment: AlignmentDirectional.center,
              child: Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: Transform.rotate(
                  angle: -_animation.value * 2 * pi / 200,
                  child: const FlutterLogo(size: 88),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: FloatingActionButton(
                  onPressed: () {
                    _controller.repeat();
                  },
                  child: const Icon(Icons.refresh),
                ),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
