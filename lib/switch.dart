import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'switch.over_react.g.dart';

// STOP! You should not have to change anything in this file to
// make it through the workshop. If tests are failing because of
// this switch not having properties set correctly, then the
// problem is probably in your implementation. Tip: Check
// your `render` method or the `getTogglerProps` method
// (if we've gotten to that part)
@Factory()
// ignore: undefined_identifier
UiFactory<SwitchProps> Switch = _$Switch;

@Props()
class _$SwitchProps extends UiProps {
  /// Wether the switch should appear on or off.
  bool isOn;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class SwitchProps extends _$SwitchProps with _$SwitchPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForSwitchProps;
}

@Component()
class SwitchComponent extends UiComponent<SwitchProps> {
  String get btnClassNames => [
        props.className,
        'toggle-btn',
        props.isOn ? 'toggle-btn-on' : 'toggle-btn-off',
      ].join(' ');

  @override
  Map getDefaultProps() => newProps()
    ..isOn = false
    ..className = '';

  @override
  render() {
    return (Dom.div()..addTestId('switch')..addProps(copyUnconsumedDomProps()))(
      (Dom.input()
        ..addTestId('switch.input')
        ..className = 'toggle-input'
        ..type = 'checkbox'
        ..checked = props.isOn
      )(),
      (Dom.button()
        ..addTestId('switch.button')
        ..addProps(copyUnconsumedDomProps())
        ..className = btnClassNames
        ..aria.label = 'Toggle'
      )(),
    );
  }
}
