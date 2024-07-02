import 'package:flutter/material.dart';
import 'package:mpflutter_core/mpflutter_core.dart';
import 'package:mpflutter_wechat_api/mpflutter_wechat_api.dart';
import 'package:mpflutter_wechat_mapview/mpflutter_wechat_mapview.dart';

class WXMapView extends StatefulWidget {
  const WXMapView({super.key});

  @override
  State<WXMapView> createState() => _WXMapViewState();
}

class _WXMapViewState extends State<WXMapView> {
  final controller = MPFlutter_Wechat_MapViewController();
  String selectedAddress = "";

  @override
  Widget build(BuildContext context) {
    return MPFlutterPlatformOverlaySupport(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('WXMapView'),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: MPFlutter_Wechat_MapView(
                controller: controller,
                longitude: 113.347698,
                latitude: 23.100022,
                showLocation: true,
                markers: const [
                  {
                    "id": "HeJi",
                    "title": "赫基大厦",
                    "longitude": 113.347698,
                    "latitude": 23.100022,
                  },
                  {
                    "id": "WeChat",
                    "title": "微信总部",
                    "longitude": 113.324560,
                    "latitude": 23.100100,
                  }
                ],
                onMarkerTap: (detail) {
                  setState(() {
                    selectedAddress = detail["markerId"];
                  });
                },
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              height: 300,
              child: MPFlutterPlatformOverlay(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    color: Colors.white,
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('当前选中的地点是: $selectedAddress'),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('To > 微信总部'),
                          onTap: () {
                            final mapContext = controller.getMapContext();
                            if (mapContext != null) {
                              mapContext.moveToLocation(
                                MoveToLocationOption()
                                  ..latitude = 23.100100
                                  ..longitude = 113.324560,
                              );
                            }
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('Include Points'),
                          onTap: () {
                            final mapContext = controller.getMapContext();
                            if (mapContext != null) {
                              mapContext.includePoints(
                                IncludePointsOption()
                                  ..points = [
                                    MapPostion()
                                      ..latitude = 23.100100
                                      ..longitude = 113.324560,
                                    MapPostion()
                                      ..latitude = 23.100022
                                      ..longitude = 113.347698,
                                  ]
                                  ..fail = (result) {
                                    print(result.errMsg);
                                  },
                              );
                            }
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('To > Image'),
                          onTap: () {
                            Navigator.of(context).pushNamed('/ext/wx_image');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('WXMapView'),
  //     ),
  //     body: Column(
  //       children: [
  //         SizedBox(
  //           height: 400,
  //           child: MPFlutter_Wechat_MapView(
  //             controller: controller,
  //             longitude: 113.347698,
  //             latitude: 23.100022,
  //             showLocation: true,
  //             markers: const [
  //               {
  //                 "id": "HeJi",
  //                 "title": "赫基大厦",
  //                 "longitude": 113.347698,
  //                 "latitude": 23.100022,
  //               },
  //               {
  //                 "id": "WeChat",
  //                 "title": "微信总部",
  //                 "longitude": 113.324560,
  //                 "latitude": 23.100100,
  //               }
  //             ],
  //             onMarkerTap: (detail) {
  //               setState(() {
  //                 selectedAddress = detail["markerId"];
  //               });
  //             },
  //           ),
  //         ),
  //         Expanded(
  //           child: ListView(
  //             children: [
  //               ListTile(
  //                 title: Text('当前选中的地点是: $selectedAddress'),
  //               ),
  //               const Divider(),
  //               ListTile(
  //                 title: const Text('To > 微信总部'),
  //                 onTap: () {
  //                   final mapContext = controller.getMapContext();
  //                   if (mapContext != null) {
  //                     mapContext.moveToLocation(
  //                       MoveToLocationOption()
  //                         ..latitude = 23.100100
  //                         ..longitude = 113.324560,
  //                     );
  //                   }
  //                 },
  //               ),
  //               const Divider(),
  //               ListTile(
  //                 title: const Text('Include Points'),
  //                 onTap: () {
  //                   final mapContext = controller.getMapContext();
  //                   if (mapContext != null) {
  //                     mapContext.includePoints(
  //                       IncludePointsOption()
  //                         ..points = [
  //                           MapPostion()
  //                             ..latitude = 23.100100
  //                             ..longitude = 113.324560,
  //                           MapPostion()
  //                             ..latitude = 23.100022
  //                             ..longitude = 113.347698,
  //                         ]
  //                         ..fail = (result) {
  //                           print(result.errMsg);
  //                         },
  //                     );
  //                   }
  //                 },
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
