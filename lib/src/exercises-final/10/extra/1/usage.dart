// 10: Control Props Primer

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/10/extra/1/toggle.dart';
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
  dynamic toggle1Ref;
  dynamic toggle2Ref;
}

@State(keyNamespace: '')
class _$UsageState extends UiState {
  // Wether the toggle is On or Off
  bool bothOn;
}

@Component()
class UsageComponent extends UiStatefulComponent<UsageProps, UsageState> {
  @override
  Map getInitialState() => newState()..bothOn = false;

  handleToggle(isOn) => setState(newState()..bothOn = isOn);

  @override
  render() {
    var toggle1Ref = props.toggle1Ref;
    var toggle2Ref = props.toggle2Ref;

    return Dom.div()(
      (Toggle()
        ..isOn = state.bothOn
        ..onToggle = handleToggle
        ..ref = (ref) {
          toggle1Ref = ref;
        }
      )(),
      (Toggle()
        ..isOn = state.bothOn
        ..onToggle = handleToggle
        ..ref = (ref) {
          toggle2Ref = ref;
        }
      )(),
    );
  }
}
