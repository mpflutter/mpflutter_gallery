import 'package:mpflutter/mpflutter.dart';
import 'package:flutter/material.dart';
// import 'package:full_screen_back_gesture/full_screen_back_gesture.dart';
import 'package:mpflutter_gallery/home.dart';
import 'package:mpflutter_gallery/auto_test/auto_test_page.dart'
    deferred as auto_test_page;
import 'package:mpflutter_gallery/ui/flutter_animations/page/animation01/AnimationOnePage.dart'
    deferred as animation_one_page;
import 'package:mpflutter_gallery/ui/ui_infinite_listview.dart'
    deferred as ui_infinite_listview;
import 'package:mpflutter_gallery/ui/ui_waterfall_view.dart'
    deferred as ui_waterfall_view;
import 'package:mpflutter_gallery/ui/ui_flchart.dart' deferred as ui_flchart;

void main() async {
  Logger.logLevel = LogLevel.info;
  auto_test_page.loadLibrary();
  animation_one_page.loadLibrary();
  ui_infinite_listview.loadLibrary();
  ui_waterfall_view.loadLibrary();
  ui_flchart.loadLibrary();
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
      '/auto_test': (context) => auto_test_page.AutoTestPage(),
      '/ui_infinite_listview': (context) =>
          ui_infinite_listview.UIInfiniteListViewPage(),
      '/ui_waterfall_view': (context) =>
          ui_waterfall_view.UIWaterfallViewPage(),
      '/animation_one_page': (context) => animation_one_page.AnimationOnePage(),
      '/flchart_page': (context) => ui_flchart.UIFLChartPage(),
    },
    navigatorObservers: [MPNavigatorObserver()],
  ));
}
