// 01: Building the toggle component

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/01/toggle.dart';

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
    return (Toggle()..onToggle = props.onToggle)();
  }
}
