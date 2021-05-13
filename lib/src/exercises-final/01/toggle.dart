// 01: Building the toggle component

import 'dart:html';
import 'dart:js';

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

mixin ToggleProps on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

mixin ToggleState on UiState {
  /// Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  void toggle(_) {
    setState((newState()..isOn = !state.isOn), () {
      props.onToggle(state.isOn);
    });
  }

  @override
  render() {
    return (Switch()
      ..isOn = state.isOn
      ..onClick = toggle
    )();
  }
}

//  Usage:
//  measureTextWidthCanvas('Exercise 01', fontStyle:'normal normal 700 normal 32px / normal "Antic Slab", serif');
//  measureTextWidthCanvas('Exercise 01', sourceElement: document.querySelector('#app h1'));
measureTextWidthCanvas(text, {String fontStyle, Element sourceElement}) {
  final canvas = CanvasElement();
  final canvasContext = canvas.context2D;

  if (sourceElement != null) {
    canvasContext.font = context.callMethod('getComputedStyle', [sourceElement])['font'];
  }
  if (fontStyle != null) {
    canvasContext.font = fontStyle;
  }

  final metrics = canvasContext.measureText(text);
  return metrics.width;
}

/// Copies all computed styles from [src] to [target].
///
/// Uses [CssStyleDeclaration.cssText] for Chrome, and copies each property manually for other browsers.
void copyStyles(Element src, Element target) {
  /// Use JS interop since we can't iterate over all the styles in Dart's [CssStyleDeclaration].
  final computedJs = context.callMethod('getComputedStyle', [src]) as JsObject;
  final cssText = computedJs['cssText'] as String;

  // Some browsers don't support fetching `cssText` from computed style,
  // and return an empty string instead.
  //
  // Use cssText where possible for performance reasons;
  // otherwise, iterate over the styles and copy them.
  if (cssText.isNotEmpty) {
    target.style.cssText = cssText;
  } else {
    final length = computedJs['length'];
    for (var i = 0; i < length; i++) {
      final key = computedJs[i];
      target.style.setProperty(key, computedJs[key]?.toString());
    }
  }
}
