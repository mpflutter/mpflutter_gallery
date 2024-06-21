import 'package:mpflutter_build_tools/main.dart' as build_tools;

void main(List<String> arguments) async {
  final buildArgs = [...arguments]..add('--douyin');
  build_tools.useMiniTex = true;
  build_tools.main(buildArgs);
}
