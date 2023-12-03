import 'package:mpflutter/mpflutter.dart';
import 'package:flutter/material.dart';
// import 'package:full_screen_back_gesture/full_screen_back_gesture.dart';
import 'package:mpflutter_gallery/auto_test/auto_test_page.dart';
import 'package:mpflutter_gallery/home.dart';
import 'package:mpflutter_gallery/ui/flutter_animations/page/animation01/AnimationOnePage.dart';
import 'package:mpflutter_gallery/ui/ui_infinite_listview.dart';
import 'package:mpflutter_gallery/ui/ui_simple_shader.dart';
import 'package:mpflutter_gallery/ui/ui_waterfall_view.dart';
import 'package:mpflutter_gallery/ui/ui_flchart.dart';

void main() async {
  Logger.logLevel = LogLevel.info;
  runMPApp(MaterialApp(
    title: "",
    theme: ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5.0,
        centerTitle: false,
      ),
      platform: TargetPlatform.iOS,
      // pageTransitionsTheme: const PageTransitionsTheme(
      //   builders: {
      //     TargetPlatform.iOS: FullScreenBackGesturePageTransitionsBuilder(),
      //   },
      // ),
    ),
    locale: const Locale("en"),
    routes: {
      '/': (context) => const HomePage(),
      '/auto_test': (context) => const AutoTestPage(),
      '/ui_infinite_listview': (context) => const UIInfiniteListViewPage(),
      '/ui_waterfall_view': (context) => const UIWaterfallViewPage(),
      '/animation_one_page': (context) => AnimationOnePage(),
      '/flchart_page': (context) => const UIFLChartPage(),
      '/simple_shader_page': (context) => const UISimpleShaderPage(),
    },
    navigatorObservers: [MPNavigatorObserver()],
  ));
}
