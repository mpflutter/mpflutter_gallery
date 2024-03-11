import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

class FPSCounter extends StatefulWidget {
  @override
  _FPSCounterState createState() => _FPSCounterState();
}

class _FPSCounterState extends State<FPSCounter> with WidgetsBindingObserver {
  int _fps = 0;
  int _frameCount = 0;
  DateTime? _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onFrame();
    });
  }

  void onFrame() {
    _frameCount++;
    final now = DateTime.now();
    final elapsed = now.difference(_startTime!);
    if (elapsed.inSeconds >= 1) {
      final frameRate = _frameCount ~/ elapsed.inSeconds;
      setState(() {
        _fps = frameRate;
      });
      _startTime = now;
      _frameCount = 0;
    }
    if (!mounted) return;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onFrame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'FPS: $_fps',
      style: const TextStyle(fontSize: 16.0),
    );
  }
}
