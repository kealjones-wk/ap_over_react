import 'package:dart_dev/dart_dev.dart';
import 'package:glob/glob.dart';
import 'package:over_react_format/dart_dev_tool.dart';

final config = {
  'analyze': AnalyzeTool()
    ..include = [
      Glob('lib/**.dart'),
      Glob('test/**.dart'),
      Glob('tool/**.dart'),
    ],
  'format': OverReactFormatTool()..lineLength = 120,
  'test': TestTool()
    ..buildArgs = [
      '--delete-conflicting-outputs',
    ],
};
