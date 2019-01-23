import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/02/abstract_02_props.dart';

// ignore: uri_has_not_been_generated
part '02_off.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOffProps> ToggleOff = _$ToggleOff;

@Props()
class _$ToggleOffProps extends Abstract02Props {}

@Component()
class ToggleOffComponent extends UiComponent<ToggleOffProps> {
  @override
  Map getDefaultProps() => (newProps());

  @override
  render() {
    return null;
  }
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleOffProps extends _$ToggleOffProps with _$ToggleOffPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleOffProps;
}
