import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/exercises-final/02/abstract_02_props.dart';

// ignore: uri_has_not_been_generated
part '02_button.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleButtonProps> ToggleButton = _$ToggleButton;

@Props()
class _$ToggleButtonProps extends Abstract02Props {}

@Component()
class ToggleButtonComponent extends UiComponent<ToggleButtonProps> {
  @override
  render() {
    return (Switch()
      ..isOn = props.isOn
      ..onClick = props.toggle
    )();
  }
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleButtonProps extends _$ToggleButtonProps
    with _$ToggleButtonPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleButtonProps;
}
