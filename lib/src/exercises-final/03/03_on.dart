import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/abstract_03_props.dart';
import 'package:ap_over_react/src/exercises-final/03/03_context.dart';
// ignore: uri_has_not_been_generated
part '03_on.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOnProps> ToggleOn = _$ToggleOn;

@Props()
class _$ToggleOnProps extends Abstract03Props {
}

@Component()
class ToggleOnComponent extends UiComponent<ToggleOnProps> {
  @override
  Map getDefaultProps() => (newProps()
    ..isOn = false
  );

  @override
  render() {
    return ToggleContext.Consumer()(
      (value) {
        TypedValue tValue = TypedValue.fromList(value);
        return tValue.isOn ? Dom.span()(props.children) : null;
      }
    );
  }
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleOnProps extends _$ToggleOnProps with _$ToggleOnPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleOnProps;
}
