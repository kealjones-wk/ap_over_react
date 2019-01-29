// Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03.dart';
import 'package:ap_over_react/src/exercises-final/03/03_on.dart';
import 'package:ap_over_react/src/exercises-final/03/03_off.dart';
import 'package:ap_over_react/src/exercises-final/03/03_button.dart';

// ignore: uri_has_not_been_generated
part '03_usage.over_react.g.dart';

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
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
  Map getDefaultProps() =>
      newProps()..onToggle = (arg) => print('onToggle $arg');

  @override
  render() {
    return (Toggle()..onToggle = props.onToggle)(
      ToggleOn()('The button is on'),
      ToggleOff()('The button is off'),
      Dom.div()(
        ToggleButton()(),
      ),
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
