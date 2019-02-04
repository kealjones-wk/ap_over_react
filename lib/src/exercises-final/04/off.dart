import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/abstract_toggle_props.dart';
import 'package:ap_over_react/src/exercises-final/04/context.dart';
import 'package:ap_over_react/src/shared/typed_value.dart';
// ignore: uri_has_not_been_generated
part 'off.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOffProps> ToggleOff = _$ToggleOff;

@Props()
class _$ToggleOffProps extends AbstractToggleProps {}

@Component()
class ToggleOffComponent extends UiComponent<ToggleOffProps> {
  @override
  Map getDefaultProps() => newProps()..isOn = false;

  @override
  render() {
    return ToggleContext.Consumer()(
      (TypedValue value) {
        return !value.isOn ? Dom.span()(props.children) : null;
      },
    );
  }
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleOffProps extends _$ToggleOffProps
    with _$ToggleOffPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleOffProps;
}
