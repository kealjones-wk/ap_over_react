// 05: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

// Here we're going to simplify our component slightly so you
// can learn the control props pattern in isolation from everything else.
// Next you'll put the pieces together.
@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
  bool isOn;
}

@State()
class _$ToggleState extends UiState {
  // Wether the toggle is On or Off
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  @override
  Map getInitialState() => newState()..isOn = false;

  // 🐨 let's add a function that can determine whether
  // the on prop is controlled. Call it `isControlled`.
  // It can accept a string called `prop` and should return
  // true if that prop is controlled
  // 💰 this.props[prop] !== undefined
  //
  // 🐨 Now let's add a function that can return the state
  // whether it's coming from this.state or this.props
  // Call it `getState` and have it return on from
  // state if it's not controlled or props if it is.

  isControlled(prop) {
    return props[prop] != null;
  }

  getState() {
    return BaseToggleProps()
      ..isOn = isControlled('isOn') ? props.isOn : state.isOn;
  }

  void toggle(SyntheticMouseEvent e) {
    // 🐨 if the toggle is controlled, then we shouldn't
    // be updating state. Instead we should just call
    // `this.props.onToggle` with what the state should be
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  @override
  render() {
    // 🐨 rather than getting state from this.state,
    // let's use our `getState` method.
    return (Switch()
      ..isOn = state.isOn
      ..onClick = toggle
    )();
  }
  // These extra credit ideas are to expand this solution to elegantly handle
  // more state properties than just a single `on` state.
  // 💯 Make the `getState` function generic enough to support all state in
  // `this.state` even if we add any number of properties to state.
  // 💯 Add support for an `onStateChange` prop which is called whenever any
  // state changes. It should be called with `changes` and `state`
  // 💯 Add support for a `type` property in the `changes` you pass to
  // `onStateChange` so consumers can differentiate different state changes.
}
