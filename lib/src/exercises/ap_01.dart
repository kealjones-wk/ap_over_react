// 01: Building the toggle component

import 'package:over_react/over_react.dart';
// 🐨 uncomment this import to get the switch component.
// It takes an `onClick` and an `on` prop
import 'package:ap_over_react/switch.dart';

part 'ap_01.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

mixin ToggleProps on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
}

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {

  // 🐨 this toggle component is going to need to have state for `on`
  @override
  get initialState => newState()..isOn = false;

  // You'll also want a method to handle when the switch is clicked
  // which will update the `on` state and call the `onToggle` prop
  // with the new `on` state.
  void toggle(_) {
      // 💯 Use a state updater function for `newState` to avoid issues with batching
      // 💰 setState(newState, callback)
      setState((newState()..isOn = !state.isOn), () {
      // The `callback` should be where you call `props.onToggle(state.isOn)`
      props.onToggle(state.isOn);
    });
  }

  @override
  render() {
    // 🐨 here you'll want to return the switch with the `on` and `onClick` props
    return (Switch()
      ..isOn = state.isOn
      ..onClick = toggle
    )();
  }
}

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');
    return (Toggle()..onToggle = onToggle)();
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
}
