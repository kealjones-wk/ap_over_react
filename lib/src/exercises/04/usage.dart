// 04: render props

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises/04/toggle.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

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
  get defaultProps => (newProps()..onToggle = (args) => print('onToggle $args'));

  @override
  render() {
    return (Toggle()..onToggle = props.onToggle)(
      (value) {
        return Dom.div()(
          value.isOn ? 'The button is on' : 'The button is off',
          (Switch()
            ..isOn = value.isOn
            ..onClick = value.toggle
          )(),
          Dom.hr()(),
          (Dom.button()
            ..aria.label = 'custom-button'
            ..onClick = value.toggle
          )(
            value.isOn ? 'on' : 'off',
          ),
        );
      },
    );
  }
}
