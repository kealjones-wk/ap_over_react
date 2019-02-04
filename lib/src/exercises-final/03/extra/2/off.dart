import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/2/toggle_consumer.dart';
import 'package:ap_over_react/src/shared/typed_value.dart';
// ignore: uri_has_not_been_generated
part 'off.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOffProps> ToggleOff = _$ToggleOff;

@Props()
class _$ToggleOffProps extends UiProps {}

@Component()
class ToggleOffComponent extends UiComponent<ToggleOffProps> {
  @override
  render() {
    return ToggleConsumer()(
      (TypedValue value) {
        return !value.isOn ? Dom.span()(props.children) : null;
      },
    );
  }
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleOffProps extends _$ToggleOffProps with _$ToggleOffPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleOffProps;
}
