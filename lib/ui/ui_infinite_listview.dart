import 'package:flutter/material.dart';
import 'package:mpflutter_core/mpflutter_core.dart';
import 'package:mpflutter_gallery/common.dart';

class UIInfiniteListViewPage extends StatefulWidget {
  const UIInfiniteListViewPage({Key? key}) : super(key: key);

  @override
  State<UIInfiniteListViewPage> createState() => _UIInfiniteListViewPageState();
}

class _UIInfiniteListViewPageState extends State<UIInfiniteListViewPage> {
  int itemCount = 100;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    print("_UIInfiniteListViewPageState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MPFlutterWechatAppShareManager.setAppShareInfo(
      context: context,
      title: '无限长 ListView',
      query: {
        'routeName': '/ui_infinite_listview',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppParams.isSinglePage
      //     ? null
      //     : AppBar(
      //         title: const Text('无限长 ListView'),
      //       ),
      appBar: DouyinAppBar(
        title: '无限长 ListView',
        frontColor: Colors.black,
        backgroundColor: Colors.blue,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification &&
              scrollNotification.metrics.extentAfter == 0) {
            // Reached the end of the list
            if (!_isLoading) {
              setState(() {
                _isLoading = true;
              });
              // Simulate an asynchronous operation
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  itemCount += 100;
                  _isLoading = false;
                });
              });
            }
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: ListView.builder(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            itemBuilder: (context, index) {
              if (index == itemCount - 1 && _isLoading) {
                return const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return ListTile(
                title: Text('Index - $index'),
              );
            },
            itemCount: itemCount,
          ),
        ),
      ),
    );
  }
}
