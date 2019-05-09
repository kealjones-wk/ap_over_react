// 11: The Provider Pattern
// Extra credit: Validate the consumer is rendered within a provider

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/1/toggle.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/1/layer_1.dart';

// ignore: uri_has_not_been_generated
part 'usage.over_react.g.dart';

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

@Component2()
class UsageComponent extends UiComponent2<UsageProps> {
  @override
  Map getDefaultProps() =>
      newProps()..onToggle = (args) => print('onToggle $args');

  @override
  render() {
    return (Toggle()..onToggle = props.onToggle)(
      Layer1()(),
    );
  }
}
