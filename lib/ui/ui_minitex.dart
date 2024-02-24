import 'dart:math';
import 'package:flutter/material.dart';

class UIMiniTexPage extends StatefulWidget {
  const UIMiniTexPage({super.key});

  @override
  _UIMiniTexPageState createState() => _UIMiniTexPageState();
}

class _UIMiniTexPageState extends State<UIMiniTexPage> {
  var miniTextFontStyle = const TextStyle(
    fontSize: 12,
    fontFamily: "MiniTex",
  );

  var skiaTextFontStyle = const TextStyle(
    fontSize: 12,
    fontFamily: "Roboto",
    fontFamilyFallback: ["Roboto", "Noto Sans SC"],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MiniTex'),
      ),
      body: ListView(
        children: [
          _renderHeader(),
          const Divider(height: 1),
          _renderSimpleText(),
          const Divider(),
          _renderTextWithLetterSpacing(),
          const Divider(),
          _renderTextWithWordSpacing(),
          const Divider(),
          _renderFontWeightText(),
          const Divider(),
          _renderTextWithBackground(),
          const Divider(),
          _renderTextWithItalicFontStyle(),
          const Divider(),
          _renderTextWithMultipleLanguages(),
          const Divider(),
          _renderMultipleLinesText(),
          const Divider(),
          _renderMultipleLinesTextAlignJustify(),
          const Divider(),
          _renderMultipleLinesTextWithMaxLines(),
          const Divider(),
          _renderUnderlineText(),
          const Divider(),
          _renderDoubleUnderlineText(),
          const Divider(),
          _renderLineThroughText(),
          const Divider(),
          _renderOverlineAndUnderlineText(),
          const Divider(),
          _renderTextWithShadow(),
          const Divider(),
          _renderRichText(),
          const Divider(),
        ],
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {
          print("font size");
          print(miniTextFontStyle.fontSize);
          setState(() {
            miniTextFontStyle = TextStyle(
              fontSize: miniTextFontStyle.fontSize! + 1,
              fontFamily: "MiniTex",
            );
            skiaTextFontStyle = TextStyle(
              fontSize: skiaTextFontStyle.fontSize! + 1,
              fontFamily: "Roboto",
              fontFamilyFallback: const ["Roboto", "Noto Sans SC"],
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Row _renderHeader() {
    return Row(
      children: [
        Container(
          height: 32,
          color: Colors.lightBlue.shade100,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: const Text('MiniTex'),
        ),
        Container(
          height: 32,
          color: Colors.lightBlue.shade100,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: const Text('Skia'),
        ),
      ],
    );
  }

  Row _renderSimpleText() {
    return Row(
      children: [
        Container(
          height: 66,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World! Test',
            style: miniTextFontStyle.merge(const TextStyle(
              color: Colors.blue,
            )),
          ),
        ),
        Container(
          height: 66,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World! Test',
            style: skiaTextFontStyle.merge(const TextStyle(
              color: Colors.blue,
            )),
          ),
        ),
      ],
    );
  }

  Row _renderFontWeightText() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Font Weight 字重 100',
                style: miniTextFontStyle.merge(
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Text(
                'Font Weight 字重 400',
                style: miniTextFontStyle.merge(
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                'Font Weight 字重 700',
                style: miniTextFontStyle.merge(
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Font Weight 字重 900',
                style: miniTextFontStyle.merge(
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 66,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Font Weight 字重 100',
                style: skiaTextFontStyle.merge(
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Text(
                'Font Weight 字重 400',
                style: skiaTextFontStyle.merge(
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                'Font Weight 字重 700',
                style: skiaTextFontStyle.merge(
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Font Weight 字重 900',
                style: skiaTextFontStyle.merge(
                  const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _renderTextWithBackground() {
    return Row(
      children: [
        Container(
          height: 66,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World!',
            style: miniTextFontStyle.merge(const TextStyle(
              backgroundColor: Colors.yellow,
            )),
          ),
        ),
        Container(
          height: 66,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World!',
            style: skiaTextFontStyle.merge(const TextStyle(
              backgroundColor: Colors.yellow,
            )),
          ),
        ),
      ],
    );
  }

  Row _renderTextWithItalicFontStyle() {
    return Row(
      children: [
        Container(
          height: 66,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World!',
            style: miniTextFontStyle.merge(const TextStyle(
              fontStyle: FontStyle.italic,
            )),
          ),
        ),
        Container(
          height: 66,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World!',
            style: skiaTextFontStyle.merge(const TextStyle(
              fontStyle: FontStyle.italic,
            )),
          ),
        ),
      ],
    );
  }

  Row _renderTextWithMultipleLanguages() {
    return Row(
      children: [
        Container(
          height: 160,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World!\n你好，世界！\nBonjour, le monde !\nこんにちは、世界！\nHallo, Welt!\nПривет, мир!',
            style: miniTextFontStyle.merge(const TextStyle(
              fontStyle: FontStyle.italic,
            )),
          ),
        ),
        Container(
          height: 160,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World!\n你好，世界！\nBonjour, le monde !\nこんにちは、世界！\nHallo, Welt!\nПривет, мир!',
            style: skiaTextFontStyle.merge(const TextStyle(
              fontStyle: FontStyle.italic,
            )),
          ),
        ),
      ],
    );
  }

  Row _renderMultipleLinesText() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!你好吗？这是多行文本，这里应该有很多文字字字字。',
              style: miniTextFontStyle.merge(const TextStyle(
                color: Colors.red,
              )),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!你好吗？这是多行文本，这里应该有很多文字字字字。',
              style: skiaTextFontStyle.merge(const TextStyle(
                color: Colors.red,
              )),
            ),
          ),
        ),
      ],
    );
  }

  Row _renderMultipleLinesTextAlignJustify() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              '　　空出前两空格才是正确的，你好吗？这是多行Hello, World!文本，这里应该有很多文字字字字。',
              style: miniTextFontStyle.merge(const TextStyle(
                color: Colors.red,
              )),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              '　　空出前两空格才是正确的，你好吗？这是多行Hello, World!文本，这里应该有很多文字字字字。',
              style: skiaTextFontStyle.merge(const TextStyle(
                color: Colors.red,
              )),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }

  Row _renderMultipleLinesTextWithMaxLines() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!你好吗？这是多行文本，这里应该有很多文字字字字。',
              style: miniTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                ),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!你好吗？这是多行文本，这里应该有很多文字字字字。',
              style: skiaTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                ),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Row _renderTextWithLetterSpacing() {
    return Row(
      children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World!Test 你好吗？同学，Hello Mate.',
            style: miniTextFontStyle.merge(const TextStyle(
              color: Colors.blue,
              letterSpacing: 8,
            )),
          ),
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World!Test 你好吗？同学，Hello Mate.',
            style: skiaTextFontStyle.merge(const TextStyle(
              color: Colors.blue,
              letterSpacing: 8,
            )),
          ),
        ),
      ],
    );
  }

  Row _renderTextWithWordSpacing() {
    return Row(
      children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World! Test 你好 吗？同  学，Hello Mate.',
            style: miniTextFontStyle.merge(const TextStyle(
              color: Colors.blue,
              wordSpacing: 16,
            )),
          ),
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Text(
            'Hello, World! Test 你好 吗？同  学，Hello Mate.',
            style: skiaTextFontStyle.merge(const TextStyle(
              color: Colors.blue,
              wordSpacing: 16,
            )),
          ),
        ),
      ],
    );
  }

  Row _renderUnderlineText() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: miniTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.green,
                  decorationThickness: 1,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: skiaTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.green,
                  decorationThickness: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _renderDoubleUnderlineText() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: miniTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double,
                  decorationColor: Colors.green,
                  decorationThickness: 1,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: skiaTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double,
                  decorationColor: Colors.green,
                  decorationThickness: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _renderLineThroughText() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: miniTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.dotted,
                  decorationColor: Colors.green,
                  decorationThickness: 1,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: skiaTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.dotted,
                  decorationColor: Colors.green,
                  decorationThickness: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _renderOverlineAndUnderlineText() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: miniTextFontStyle.merge(
                TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.combine([
                    TextDecoration.overline,
                    TextDecoration.underline,
                  ]),
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationColor: Colors.green,
                  decorationThickness: 1,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: skiaTextFontStyle.merge(
                TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.combine([
                    TextDecoration.overline,
                    TextDecoration.underline,
                  ]),
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationColor: Colors.green,
                  decorationThickness: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _renderTextWithShadow() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: miniTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 8,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            child: Text(
              'Hello, World!',
              style: skiaTextFontStyle.merge(
                const TextStyle(
                  color: Colors.red,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 8,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _renderRichText() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '你好',
                  style: miniTextFontStyle.merge(
                    const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ),
                TextSpan(
                  text: 'Hello, World!\n',
                  style: miniTextFontStyle.merge(
                    const TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                    ),
                  ),
                ),
                TextSpan(
                  text: '世界，自由',
                  style: miniTextFontStyle.merge(
                    const TextStyle(
                      fontSize: 24,
                      color: Colors.orange,
                      backgroundColor: Colors.brown,
                    ),
                  ),
                ),
                TextSpan(
                  text: '和平。\n🚗⚽️🎾🏉',
                  style: miniTextFontStyle.merge(
                    const TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
              style: miniTextFontStyle,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '你好',
                  style: skiaTextFontStyle.merge(
                    const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ),
                TextSpan(
                  text: 'Hello, World!\n',
                  style: skiaTextFontStyle.merge(
                    const TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                    ),
                  ),
                ),
                TextSpan(
                  text: '世界，自由',
                  style: skiaTextFontStyle.merge(
                    const TextStyle(
                      fontSize: 24,
                      color: Colors.orange,
                      backgroundColor: Colors.brown,
                    ),
                  ),
                ),
                TextSpan(
                  text: '和平。\n🚗⚽️🎾🏉',
                  style: skiaTextFontStyle.merge(
                    const TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
              style: skiaTextFontStyle,
            ),
          ),
        ),
      ],
    );
  }
}
