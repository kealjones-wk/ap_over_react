import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/2/toggle_consumer.dart';
import 'package:ap_over_react/src/shared/typed_value.dart';

// ignore: uri_has_not_been_generated
part 'button.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleButtonProps> ToggleButton = _$ToggleButton;

@Props()
class _$ToggleButtonProps extends UiProps {}

@Component()
class ToggleButtonComponent extends UiComponent<ToggleButtonProps> {
  @override
  render() {
    return ToggleConsumer()(
      (TypedValue value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.onClick
        )();
      },
    );
  }
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleButtonProps extends _$ToggleButtonProps with _$ToggleButtonPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleButtonProps;
}
