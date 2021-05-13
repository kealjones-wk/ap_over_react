// 02: Compound Components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/02/toggle.dart';
import 'package:ap_over_react/src/exercises-final/02/button.dart';
import 'package:ap_over_react/src/exercises-final/02/on.dart';
import 'package:ap_over_react/src/exercises-final/02/off.dart';

part 'usage.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<UsageProps> Usage = castUiFactory(_$Usage);

mixin UsageProps on UiProps {
  Callback1Arg onToggle;
}

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
