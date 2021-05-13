// 02: Compound Components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises/02/toggle.dart';

part 'usage.over_react.g.dart';

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = castUiFactory(_$Usage);

mixin UsageProps on UiProps {
  Callback1Arg onToggle;
}

class UsageComponent extends UiComponent2<UsageProps> {
  @override
  get defaultProps => (newProps()..onToggle = (arg) => print('onToggle $arg'));

  @override
  render() {
    return (Toggle()..onToggle = props.onToggle)(
      ToggleComponent.On()('The button is on'),
      ToggleComponent.Off()('The button is off'),
      ToggleComponent.Button()(),
    );
  }
}
