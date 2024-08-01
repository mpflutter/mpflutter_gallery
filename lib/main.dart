import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mpflutter_core/mpflutter_core.dart';
import 'package:flutter/material.dart' deferred as material
    show
        Scaffold,
        MaterialApp,
        ThemeData,
        AppBarTheme,
        Colors,
        TargetPlatform,
        Locale,
        ThemeMode,
        Icons;
import 'package:full_screen_back_gesture/full_screen_back_gesture.dart';
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
import 'package:mpflutter_gallery/ui/ui_minitex.dart' deferred as ui_minitex;
import 'package:mpflutter_gallery/ext/wx_video_view.dart'
    deferred as wx_video_view;
import 'package:mpflutter_gallery/ext/wx_map_view.dart' deferred as wx_map_view;
import 'package:mpflutter_gallery/ext/wx_button.dart' deferred as wx_button;
import 'package:mpflutter_gallery/ext/wx_web_view.dart' deferred as wx_web_view;
import 'package:mpflutter_gallery/ext/wx_image.dart' deferred as wx_image;
import 'package:mpflutter_gallery/ext/wx_ad.dart' deferred as wx_ad;
import 'package:mpflutter_gallery/benchmark/benchmark.dart'
    deferred as benchmark;
import 'package:mpflutter_gallery/ext/audioplayer.dart' deferred as audioplayer;

void main() async {
  // Logger.logLevel = LogLevel.info;
  await material.loadLibrary();
  await auto_test_page.loadLibrary();
  await animation_one_page.loadLibrary();
  await ui_infinite_listview.loadLibrary();
  await ui_waterfall_view.loadLibrary();
  await ui_flchart.loadLibrary();
  await ui_form_app.loadLibrary();
  await ui_grid_image.loadLibrary();
  await ui_minitex.loadLibrary();
  await wx_video_view.loadLibrary();
  await wx_map_view.loadLibrary();
  await wx_button.loadLibrary();
  await wx_web_view.loadLibrary();
  await wx_image.loadLibrary();
  await wx_ad.loadLibrary();
  await benchmark.loadLibrary();
  await audioplayer.loadLibrary();
  runMPApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    MPFlutterDarkmodeManager.addThemeListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return material.MaterialApp(
      title: "",
      darkTheme: material.ThemeData(
        useMaterial3: true,
        appBarTheme: material.AppBarTheme(
          color: material.Colors.black,
          foregroundColor: material.Colors.grey,
          elevation: 5.0,
          centerTitle: false,
        ),
        platform: material.TargetPlatform.iOS,
      ),
      theme: material.ThemeData(
        useMaterial3: true,
        appBarTheme: material.AppBarTheme(
          color: material.Colors.blue,
          foregroundColor: material.Colors.white,
          elevation: 5.0,
          centerTitle: false,
        ),
        fontFamily: "MiniTex",
        fontFamilyFallback: const ["MiniTex"],
        platform: material.TargetPlatform.iOS,
      ),
      themeMode: MPFlutterDarkmodeManager.isDarkmode()
          ? material.ThemeMode.dark
          : material.ThemeMode.light,
      locale: material.Locale("en"),
      routes: {
        '/': (context) => const HomePage(),
        '/auto_test': (context) => auto_test_page.AutoTestPage(),
        '/ui_infinite_listview': (context) =>
            ui_infinite_listview.UIInfiniteListViewPage(),
        '/ui_waterfall_view': (context) =>
            ui_waterfall_view.UIWaterfallViewPage(),
        '/ui_grid_image': (context) => ui_grid_image.UIGridImagePage(),
        '/ui_minitex': (context) => ui_minitex.UIMiniTexPage(),
        '/animation_one_page': (context) =>
            animation_one_page.AnimationOnePage(),
        '/flchart_page': (context) => ui_flchart.UIFLChartPage(),
        '/form_app/home': (context) => ui_form_app.HomePage(),
        '/form_app/signin_http': (context) => ui_form_app.SignInHttpDemo(),
        '/form_app/autofill': (context) => ui_form_app.AutofillDemo(),
        '/form_app/form_widgets': (context) => ui_form_app.FormWidgetsDemo(),
        '/form_app/form_widgets_mp': (context) =>
            ui_form_app.FormWidgetsMPDemo(),
        '/form_app/validation': (context) => ui_form_app.FormValidationDemo(),
        '/ext/wx_video_view': (context) => wx_video_view.WXVideoView(),
        '/ext/wx_map_view': (context) => wx_map_view.WXMapView(),
        '/ext/wx_button': (context) => wx_button.WXButton(),
        '/ext/wx_web_view': (context) => wx_web_view.WXWebView(),
        '/ext/wx_image': (context) => wx_image.WXImage(),
        '/ext/wx_ad': (context) => wx_ad.WXAd(),
        '/benchmark': (context) => benchmark.BenchmarkPage(),
        '/audioplayer': (context) => audioplayer.AudioPlayerPage(),
      },
      // home: material.Scaffold(
      //   body: Center(
      //     child: Container(
      //       color: material.Colors.yellow,
      //       // width: 150,
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Icon(
      //             material.Icons.airline_seat_recline_extra_sharp,
      //             color: material.Colors.green,
      //             size: 48,
      //           ),
      //           Container(
      //             // constraints: BoxConstraints(
      //             //   maxHeight: 60,
      //             // ),
      //             child: RichText(
      //               text: TextSpan(
      //                 children: [
      //                   TextSpan(
      //                     text: 'Hello',
      //                     style: TextStyle(
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.w700,
      //                       fontStyle: FontStyle.italic,
      //                       color: material.Colors.blue,
      //                       backgroundColor: material.Colors.white,
      //                       decoration: TextDecoration.underline,
      //                       decorationColor: material.Colors.black,
      //                       decorationStyle: TextDecorationStyle.solid,
      //                       decorationThickness: 1.0,
      //                       // height: 3,
      //                     ),
      //                   ),
      //                   TextSpan(
      //                       text: ', Spring Festval!',
      //                       style: TextStyle(
      //                         fontSize: 24,
      //                         color: material.Colors.red,
      //                         backgroundColor: material.Colors.green,
      //                       )),
      //                   TextSpan(
      //                       text: '新年好~\n',
      //                       style: TextStyle(
      //                         fontSize: 32,
      //                         color: material.Colors.brown,
      //                         // decoration: TextDecoration.underline,
      //                         decoration: TextDecoration.combine([
      //                           TextDecoration.underline,
      //                           TextDecoration.lineThrough,
      //                         ]),
      //                         decorationColor: material.Colors.red,
      //                         decorationStyle: TextDecorationStyle.dashed,
      //                         decorationThickness: 2.0,
      //                       )),
      //                   TextSpan(
      //                       text: '这是新的一行',
      //                       style: TextStyle(
      //                         fontSize: 32,
      //                         color: material.Colors.brown,
      //                         // decoration: TextDecoration.underline,
      //                         decoration: TextDecoration.combine([
      //                           TextDecoration.underline,
      //                           TextDecoration.lineThrough,
      //                         ]),
      //                         decorationColor: material.Colors.red,
      //                         decorationStyle: TextDecorationStyle.dashed,
      //                         decorationThickness: 2.0,
      //                       )),
      //                   // TextSpan(
      //                   //     text: '你好吗？',
      //                   //     style: TextStyle(
      //                   //       fontSize: 32,
      //                   //       color: material.Colors.black,
      //                   //     )),
      //                   // TextSpan(
      //                   //     text: '123',
      //                   //     style: TextStyle(
      //                   //       fontSize: 48,
      //                   //       color: material.Colors.black,
      //                   //     )),
      //                   // TextSpan(
      //                   //   children: [
      //                   //     TextSpan(text: '233'),
      //                   //     TextSpan(
      //                   //         text: '333\n',
      //                   //         style: TextStyle(color: material.Colors.blue)),
      //                   //   ],
      //                   //   style: TextStyle(
      //                   //     fontSize: 64,
      //                   //     color: material.Colors.orange,
      //                   //   ),
      //                   // ),
      //                 ],
      //               ),
      //               textAlign: TextAlign.left,
      //               // maxLines: 2,
      //               // overflow: TextOverflow.ellipsis,
      //               // strutStyle: StrutStyle(
      //               //   fontFamily: "Roboto",
      //               //   height: 200,
      //               //   fontSize: 200,
      //               //   leading: 200,
      //               //   forceStrutHeight: true,
      //               // ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      navigatorObservers: [MPNavigatorObserver()],
    );
  }
}
