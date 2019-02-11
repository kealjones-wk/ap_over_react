// Prop Getters

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/07/toggle.dart';
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

@Props(keyNamespace: '')
class _$UsageProps extends UiProps {
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
}

@Component()
class UsageComponent extends UiComponent<UsageProps> {

  @override
  Map getDefaultProps() => newProps()
        ..onToggle = (args) { print('onToggle $args'); }
        ..onToggleReset = (args) { print('onToggleReset $args'); };

  @override
  render() {
    return (Toggle()
      ..initialOn = false
      ..onToggle = props.onToggle
      ..onToggleReset = props.onToggleReset
    )(
      (BaseToggleProps value) {
        return Dom.div()(
          (Switch()
            ..addProps(value.getTogglerProps(BaseToggleProps()..isOn = value.isOn))
          )(),
          Dom.hr()(),
          (Dom.button()..onClick = (_) { value.reset(); } )('Reset'),
        );
      },
    );
  }
}
