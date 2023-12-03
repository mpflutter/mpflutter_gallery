import 'package:flutter/material.dart';

final examples = {
  "MPFlutter Auto Test": "/auto_test",
  "无限长 ListView": "/ui_infinite_listview",
  "瀑布流 WaterfallView": "/ui_waterfall_view",
  "Animation One Page": "/animation_one_page",
  "图表 fl_chart": "/flchart_page",
  "Simple Shader": "/simple_shader_page",
};
final exampleKeys = examples.keys.toList();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MPFlutter 小程序示例'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(examples[exampleKeys[index]]!);
            },
            title: Text(exampleKeys[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black.withAlpha(32),
            indent: 16,
            endIndent: 16,
          );
        },
        itemCount: exampleKeys.length,
      ),
    );
  }
}
