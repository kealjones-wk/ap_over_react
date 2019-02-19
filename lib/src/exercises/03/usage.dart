// 03: Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises/03/toggle.dart';
import 'package:ap_over_react/src/exercises/03/on.dart';
import 'package:ap_over_react/src/exercises/03/off.dart';
import 'package:ap_over_react/src/exercises/03/button.dart';

// ignore: uri_has_not_been_generated
part 'usage.over_react.g.dart';

//var ToggleContext = createContext();
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
      newProps()..onToggle = (args) => print('onToggle $args');

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
