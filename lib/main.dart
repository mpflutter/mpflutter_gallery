import 'package:mpflutter_core/mpflutter_core.dart';
import 'package:flutter/material.dart' deferred as material
    show MaterialApp, ThemeData, AppBarTheme, Colors, TargetPlatform, Locale;
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
import 'package:mpflutter_gallery/ui/ui_grid_image.dart'
    deferred as ui_grid_image;
import 'package:mpflutter_gallery/ui/form_app/main.dart'
    deferred as ui_form_app;
import 'package:mpflutter_gallery/ext/wx_video_view.dart'
    deferred as wx_video_view;
import 'package:mpflutter_gallery/ext/wx_map_view.dart' deferred as wx_map_view;
import 'package:mpflutter_gallery/ext/wx_button.dart' deferred as wx_button;
import 'package:mpflutter_gallery/ext/wx_web_view.dart' deferred as wx_web_view;

void main() async {
  Logger.logLevel = LogLevel.info;
  await material.loadLibrary();
  await auto_test_page.loadLibrary();
  await animation_one_page.loadLibrary();
  await ui_infinite_listview.loadLibrary();
  await ui_waterfall_view.loadLibrary();
  await ui_flchart.loadLibrary();
  await ui_form_app.loadLibrary();
  await ui_grid_image.loadLibrary();
  await wx_video_view.loadLibrary();
  await wx_map_view.loadLibrary();
  await wx_button.loadLibrary();
  await wx_web_view.loadLibrary();
  runMPApp(material.MaterialApp(
    title: "",
    theme: material.ThemeData(
      useMaterial3: true,
      appBarTheme: material.AppBarTheme(
        color: material.Colors.blue,
        foregroundColor: material.Colors.white,
        elevation: 5.0,
        centerTitle: false,
      ),
      platform: material.TargetPlatform.iOS,
      // pageTransitionsTheme: const PageTransitionsTheme(
      //   builders: {
      //     TargetPlatform.iOS: FullScreenBackGesturePageTransitionsBuilder(),
      //   },
      // ),
    ),
    locale: material.Locale("en"),
    routes: {
      '/': (context) => const HomePage(),
      '/auto_test': (context) => auto_test_page.AutoTestPage(),
      '/ui_infinite_listview': (context) =>
          ui_infinite_listview.UIInfiniteListViewPage(),
      '/ui_waterfall_view': (context) =>
          ui_waterfall_view.UIWaterfallViewPage(),
      '/ui_grid_image': (context) => ui_grid_image.UIGridImagePage(),
      '/animation_one_page': (context) => animation_one_page.AnimationOnePage(),
      '/flchart_page': (context) => ui_flchart.UIFLChartPage(),
      '/form_app/home': (context) => ui_form_app.HomePage(),
      '/form_app/signin_http': (context) => ui_form_app.SignInHttpDemo(),
      '/form_app/autofill': (context) => ui_form_app.AutofillDemo(),
      '/form_app/form_widgets': (context) => ui_form_app.FormWidgetsDemo(),
      '/form_app/validation': (context) => ui_form_app.FormValidationDemo(),
      '/ext/wx_video_view': (context) => wx_video_view.WXVideoView(),
      '/ext/wx_map_view': (context) => wx_map_view.WXMapView(),
      '/ext/wx_button': (context) => wx_button.WXButton(),
      '/ext/wx_web_view': (context) => wx_web_view.WXWebView(),
    },
    navigatorObservers: [MPNavigatorObserver()],
  ));
}
