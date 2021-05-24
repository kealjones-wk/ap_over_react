// 01: Building the toggle component

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';

part 'ap_01.over_react.g.dart';

//-- using a component from the library 🤔
//-- what does _$Toggle mean❓
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

//-- mixins are good for shared behavior 🤔
mixin ToggleProps on UiProps {
  // Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
  //-- what is this structure❓
  //-- (return type) Function(____) ____ ❓
}

mixin ToggleState on UiState {
  // ToggleState has a bool value (isOn) ✅
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {

  // 🐨 
  @override //-- why the override? is there a default initialState❓
  get initialState => newState()..isOn = false; // this toggle component is going to need to have state for `on` ✅

  // You'll also want a method to handle when the switch is clicked
  // which will update the `on` state and call the `onToggle` prop
  // with the new `on` state.
  void toggle(_) {
      // Use a state updater function for `newState` to avoid issues with batching
      // setState(newState, callback)
      setState((newState()..isOn = !state.isOn), () { // is this callback an anonymous function? (no return type or name)❓
      // The `callback` should be where you call `props.onToggle(state.isOn)`
      props.onToggle(state.isOn);
    });
  }

  @override
  render() {
    // here you'll want to return the switch with the `on` and `onClick` props
    return (Switch()
      ..isOn = state.isOn // '..' replaces something like 'this.' right (cascade)❓
      ..onClick = toggle
    )();
  }
}

// what does Usage essentially do❓
UiFactory<UsageProps> Usage = uiFunction(
  (props) { //-- ?? = null-aware operator ✅
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');
    return (Toggle()..onToggle = onToggle)();
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
}
