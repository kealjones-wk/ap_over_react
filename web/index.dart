import 'dart:html';

import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react/components.dart' show ErrorBoundary;

import './app.dart';

main() {
  // Mount / render your component.
  react_dom.render(
    ErrorBoundary()(
      App()(),
    ),
    querySelector('#app'),
  );
}
