library tool.dev;

import 'package:dart_dev/dart_dev.dart' show config, dev;

main(List<String> args) async {
  // https://github.com/Workiva/dart_dev

  // Perform task configuration here as necessary.

  // Available task configurations:
  // config.analyze
  // config.copyLicense
  // config.coverage
  // config.docs
  // config.examples
  // config.format
  config.format.exclude = [
    'tool/over_react_format/'
    ];
  config.test.platforms = [
      'chrome'
    ];

  await dev(args);
}
