/// The example code copy from https://github.com/fluttercandies/waterfall_flow/blob/master/example/lib/pages/simple/random_sized_demo.dart
/// Thanks FlutterCandies
///
///  create by zmtzawqlp on 2019/11/19
///
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class UIWaterfallViewPage extends StatefulWidget {
  const UIWaterfallViewPage({super.key});

  @override
  _UIWaterfallViewPageState createState() => _UIWaterfallViewPageState();
}

class _UIWaterfallViewPageState extends State<UIWaterfallViewPage> {
  List<Color> colors = <Color>[];
  int crossAxisCount = 4;
  double crossAxisSpacing = 5.0;
  double mainAxisSpacing = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('瀑布流'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                'I\'m other slivers',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SliverWaterfallFlow(
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              collectGarbage: (List<int> garbages) {
                print('collect garbage : $garbages');
              },
              viewportBuilder: (int firstIndex, int lastIndex) {
                print('viewport : [$firstIndex,$lastIndex]');
              },
            ),
            delegate: SliverChildBuilderDelegate((BuildContext c, int index) {
              final Color color = getRandomColor(index);
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: getRandomColor(index)),
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: TextStyle(
                      color: color.computeLuminance() < 0.5
                          ? Colors.white
                          : Colors.black),
                ),
                //height: index == 5 ? 1500.0 : 100.0,
                height: ((index % 3) + 1) * 100.0,
              );
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            crossAxisCount++;
            //mainAxisSpacing+=5.0;
            //crossAxisSpacing+=5.0;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Color getRandomColor(int index) {
    if (index >= colors.length) {
      colors.add(Color.fromARGB(255, Random.secure().nextInt(255),
          Random.secure().nextInt(255), Random.secure().nextInt(255)));
    }

    return colors[index];
  }
}
