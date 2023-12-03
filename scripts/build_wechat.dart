// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  Directory? mpflutterSrcRoot;
  final pkgConfig = File('.dart_tool/package_config.json');
  final pkgConfigData = json.decode(pkgConfig.readAsStringSync());
  (pkgConfigData["packages"] as List).forEach((it) {
    if (it['name'] == "mpflutter_build_tools") {
      mpflutterSrcRoot = Directory.fromUri(Uri.parse(it['rootUri']));
    }
  });
  if (mpflutterSrcRoot == null) {
    print(
      "Error: 未能找到 mpflutter build tools\nTips: 请检查 mpflutter_build_tools 是否在 pubspec.yaml 中添加依赖。",
    );
    return;
  }

  final flutterProcess = await Process.start('dart', [
    "run",
    "${mpflutterSrcRoot!.path}/lib/main.jit",
    ...arguments,
    "--wechat",
  ]);

  // 获取Flutter命令的输出
  flutterProcess.stdout.transform(utf8.decoder).listen((data) {
    print(data);
  });

  // 获取Flutter命令的错误输出
  flutterProcess.stderr.transform(utf8.decoder).listen((data) {
    print(data);
  });

  // 等待Flutter命令完成
  flutterProcess.exitCode.then((exitCode) {
    if (exitCode != 0) {
      print("exit code = $exitCode");
    } else {
      print("done");
    }
  });
}
