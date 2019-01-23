import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/02.dart';
import 'package:ap_over_react/src/exercises-final/02/02_button.dart';
import 'package:ap_over_react/src/exercises-final/02/02_on.dart';
import 'package:ap_over_react/src/exercises-final/02/02_off.dart';

// ignore: uri_has_not_been_generated
part '02_usage.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = _$Usage;

@Props()
class _$UsageProps extends UiProps {
  Callback1Arg onToggle;
}

@Component()
class UsageComponent extends UiComponent<UsageProps> {
  @override
  Map getDefaultProps() => (newProps()
    ..onToggle = (arg) => print('onToggle ${arg}')
  );

  @override
  render() {
    return (Toggle()
        ..onToggle = props.onToggle
      )(
        ToggleOn()('The button is on'),
        ToggleOff()('The button is off'),
        ToggleButton()()
      );
  }
}


// Ignore everything below here: its just temporary dart2 compatibility stuff...


// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class UsageProps extends _$UsageProps with _$UsagePropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForUsageProps;
}
