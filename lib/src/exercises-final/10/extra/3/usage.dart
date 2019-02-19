// 10: control props

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/10/extra/3/toggle.dart';

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
  Callback1Arg onStateChange;
  dynamic toggle1Ref;
  dynamic toggle2Ref;
}

@State(keyNamespace: '')
class _$UsageState extends UiState {
  // Whether the toggle is On or Off
  bool bothOn;
}

@Component()
class UsageComponent extends UiStatefulComponent<UsageProps, UsageState> {
  @override
  Map getInitialState() => newState()..bothOn = false;

  bool lastWasButton = false;

  //handleToggle(isOn) => setState(newState()..bothOn = isOn);
  handleToggle(isOn) => {};
  handleStateChange(changes) {
    bool isButtonChange =
        changes['type'] == ToggleComponent.stateChangeTypes['toggleOn'] ||
            changes['type'] == ToggleComponent.stateChangeTypes['toggleOff'];

    if (changes['type'] == ToggleComponent.stateChangeTypes['toggle'] ||
        (lastWasButton && isButtonChange)) {
      setState({'bothOn': changes['isOn']});
      lastWasButton = false;
    } else {
      lastWasButton = isButtonChange;
    }
  }

  @override
  Map getDefaultProps() => newProps()
    ..onStateChange = (_) {
      print('onStateChange');
    }
    ..onToggle = (args) => print('onToggle $args');

  @override
  render() {
    var toggle1Ref = props.toggle1Ref;
    var toggle2Ref = props.toggle2Ref;

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
          toggle1Ref = ref;
        }
      )(),
    );
  }
}
