// 10: control props
// Add support for a `type` in the changes so consumers can differentiate the
// different state updates

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/10/extra/3/toggle.dart';

part 'usage.over_react.g.dart';

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = castUiFactory(_$Usage);

@Props(keyNamespace: '')
mixin UsageProps on UiProps {
  Callback1Arg onToggle;
  Callback1Arg onStateChange;
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

  bool lastWasButton = false;

  //handleToggle(isOn) => setState((newState()..bothOn = isOn));
  handleToggle(isOn) => {};
  handleStateChange(changes) {
    final isButtonChange = changes['type'] == ToggleComponent.stateChangeTypes['toggleOn'] ||
        changes['type'] == ToggleComponent.stateChangeTypes['toggleOff'];

    if (changes['type'] == ToggleComponent.stateChangeTypes['toggle'] || (lastWasButton && isButtonChange)) {
      setState((newState()..bothOn = changes['isOn']));
      lastWasButton = false;
    } else {
      lastWasButton = isButtonChange;
    }
  }

  @override
  get defaultProps => (newProps()
    ..onStateChange = (_) {
      print('onStateChange');
    }
    ..onToggle = (args) => print('onToggle $args')
  );

  @override
  render() {
    var toggle1Ref = props.toggle1Ref; // ignore: unused_local_variable
    var toggle2Ref = props.toggle2Ref; // ignore: unused_local_variable

    return Dom.div()(
      (Toggle()
        ..isOn = state.bothOn
        ..onToggle = props.onToggle
        ..onStateChange = handleStateChange
        ..ref = (ref) {
          toggle1Ref = ref;
        }
      )(),
      (Toggle()
        ..isOn = state.bothOn
        ..onToggle = props.onToggle
        ..onStateChange = handleStateChange
        ..ref = (ref) {
          toggle2Ref = ref;
        }
      )(),
    );
  }
}
