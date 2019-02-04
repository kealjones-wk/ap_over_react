import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/abstract_toggle_props.dart';

// ignore: uri_has_not_been_generated
part 'on.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOnProps> ToggleOn = _$ToggleOn;

@Props()
class _$ToggleOnProps extends AbstractToggleProps {}

@Component()
class ToggleOnComponent extends UiComponent<ToggleOnProps> {
  @override
  render() {
    return null;
  }
}

// Ignore everything below here: its just temporary dart2 compatibility stuff...

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleOnProps extends _$ToggleOnProps with _$ToggleOnPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleOnProps;
}
