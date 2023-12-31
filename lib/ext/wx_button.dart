import 'package:flutter/material.dart';
import 'package:mpflutter_wechat_button/mpflutter_wechat_button.dart';

class WXButton extends StatefulWidget {
  const WXButton({super.key});

  @override
  State<WXButton> createState() => _WXButtonState();
}

class _WXButtonState extends State<WXButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WXButton'),
      ),
      body: Center(
        child: MPFlutter_Wechat_Button(
          openType: "getUserInfo",
          onGetUserInfo: (detail) {
            final snakeBar = SnackBar(
              content: Text(detail["userInfo"]["nickName"]),
            );
            ScaffoldMessenger.of(context).showSnackBar(snakeBar);
          },
          child: MaterialButton(
            onPressed: () {},
            child: const Text('Get User Info'),
          ),
        ),
      ),
    );
  }
}
