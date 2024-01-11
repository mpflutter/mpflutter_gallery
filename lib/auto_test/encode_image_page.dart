import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:mpflutter_core/mpflutter_core.dart';
import 'package:mpflutter_wechat_api/mpflutter_wechat_api.dart';

const _caseTitle = "Encode Image to PNG";

class EncodeImageTest extends StatefulWidget {
  const EncodeImageTest({super.key});

  @override
  State<EncodeImageTest> createState() => _EncodeImageTestState();
}

class _EncodeImageTestState extends State<EncodeImageTest> {
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

  void runTest() {
    Timer(Duration(seconds: 1), () async {
// Create a PictureRecorder and Canvas
      final recorder = ui.PictureRecorder();
      final canvas = ui.Canvas(recorder);

      // Create a Paint object with red color
      final paint = Paint()..color = Colors.red;

      // Draw a red rectangle on the canvas
      canvas.drawRect(const Rect.fromLTRB(0, 0, 8, 8), paint);

      // End recording and obtain a Picture object
      final picture = recorder.endRecording();

      // Convert the Picture to an Image
      final image = await picture.toImage(8, 8);

      // Encode to PNG data
      final pngBytes = await MPFlutterImageEncoder.encodeToBytes(
        image: image,
        format: MPFlutterImageByteFormat.png,
      );

      setState(() {
        tested = true;
        passed = pngBytes != null &&
            base64.encode(pngBytes.buffer.asUint8List()).startsWith("iVBO");
      });
    });
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
