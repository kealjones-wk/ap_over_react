// 02: Compound Components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/02/toggle.dart';
import 'package:ap_over_react/src/exercises-final/02/button.dart';
import 'package:ap_over_react/src/exercises-final/02/on.dart';
import 'package:ap_over_react/src/exercises-final/02/off.dart';

// ignore: uri_has_not_been_generated
part 'usage.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = _$Usage;

@Props()
class _$UsageProps extends UiProps {
  Callback1Arg onToggle;
}

@Component2()
class UsageComponent extends UiComponent2<UsageProps> {
  @override
  get defaultProps => (newProps()..onToggle = (args) => print('onToggle $args'));

  @override
  render() {
    return (Toggle()..onToggle = props.onToggle)(
      ToggleOn()('The button is on'),
      ToggleOff()('The button is off'),
      ToggleButton()(),
    );
  }
}
