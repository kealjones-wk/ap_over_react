// 10: control props
// this makes the `getState` function more flexible

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/10/extra/1/toggle.dart';

part 'usage.over_react.g.dart';

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = castUiFactory(_$Usage);

@Props(keyNamespace: '')
mixin UsageProps on UiProps {
  Callback1Arg onToggle;
  dynamic toggle1Ref;
  dynamic toggle2Ref;
}

@State(keyNamespace: '')
mixin UsageState on UiState {
  // Whether the toggle is On or Off
  bool bothOn;
}

class UsageComponent extends UiStatefulComponent2<UsageProps, UsageState> {
  @override
  get initialState => (newState()..bothOn = false);

  handleToggle(isOn) => setState((newState()..bothOn = isOn));

  @override
  render() {
    var toggle1Ref = props.toggle1Ref; // ignore: unused_local_variable
    var toggle2Ref = props.toggle2Ref; // ignore: unused_local_variable

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
