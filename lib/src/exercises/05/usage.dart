// 05: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises/05/toggle.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

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

@Component()
class UsageComponent extends UiComponent<UsageProps> {
  @override
  Map getDefaultProps() =>
      newProps()..onToggle = (args) => print('onToggle $args');

  @override
  render() {
    return (Toggle()..onToggle = props.onToggle)(
      (BaseToggleProps value) {
        return Dom.div()(
          (Switch()
            ..addProps(value.togglerProps)
            ..isOn = value.isOn
          )(),
          Dom.hr()(),
          (Dom.button()
            ..addProps(value.togglerProps)
            ..aria.label = 'custom-button'
          )(
            value.isOn ? 'on' : 'off'
          ),
        );
      },
    );
  }
}
