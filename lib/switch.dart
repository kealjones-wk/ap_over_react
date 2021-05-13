import 'package:over_react/over_react.dart';

part 'switch.over_react.g.dart';

// STOP! You should not have to change anything in this file to
// make it through the workshop. If tests are failing because of
// this switch not having properties set correctly, then the
// problem is probably in your implementation. Tip: Check
// your `render` method or the `getTogglerProps` method
// (if we've gotten to that part)
// ignore: undefined_identifier
UiFactory<SwitchProps> Switch = castUiFactory(_$Switch);

@Props(keyNamespace: '')
mixin SwitchProps on UiProps {
  /// Whether the switch should appear on or off.
  bool isOn;
}

class SwitchComponent extends UiComponent2<SwitchProps> {
  String get btnClassNames => [
        props.className,
        'toggle-btn',
        if (props.isOn) 'toggle-btn-on' else 'toggle-btn-off',
      ].join(' ');

  @override
  get defaultProps => (newProps()
    ..isOn = false
    ..className = ''
  );

  @override
  render() {
    return (Dom.div()
      ..addTestId('switch')
      ..modifyProps(addUnconsumedDomProps)
    )(
      (Dom.input()
        ..addTestId('switch.input')
        ..className = 'toggle-input'
        ..type = 'checkbox'
        ..checked = props.isOn
        ..readOnly = true
      )(),
      (Dom.button()
        ..addTestId('switch.button')
        ..modifyProps(addUnconsumedDomProps)
        ..className = btnClassNames
        ..aria.label = 'Toggle'
      )(),
    );
  }
}
