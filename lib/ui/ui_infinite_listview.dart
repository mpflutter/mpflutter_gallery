import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('无限长 ListView'),
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
            throw "fkjdahfjk";
            await Future.delayed(const Duration(seconds: 2));
          },
          child: ListView.builder(
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
