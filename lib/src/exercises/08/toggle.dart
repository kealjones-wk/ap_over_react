// Prop Getters

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

// Render props allow users to be in control over the UI based on state.
// State reducers allow users to be in control over logic based on actions.
// This idea is similar to redux, but only coincidentally.
//
// The basic idea is that any time there's an internal change in state, we
// first call a stateReducer prop with the current state and the changes.
// Whatever is returned is what we use in our setState call.
// This allows users of the component to return the changes they received
// or to modify the changes as they need.
//
// What this means for our implementation is that we can create a single
// function that does all the work before calling setState. Then we can
// replace all calls to setState with that function.
//
// Learn more about the state reducers pattern here:
// https://blog.kentcdodds.com/b40316cfac57

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props(keyNamespace: '')
class _$ToggleProps extends AbstractToggleProps {
  bool initialOn;
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
  Callback2Arg stateReducer;
}

@State(keyNamespace: '')
class _$ToggleState extends UiState {
  // Wether the toggle is On or Off
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  @override
  Map getDefaultProps() => newProps()
    ..initialOn = false
    ..onToggleReset = (_) {};
  // 🐨 let's add a default stateReducer here. It should return
  // the changes object as it is passed.
  @override
  Map getInitialState() => newState()..isOn = props.initialOn;
  // 🐨 let's add a method here called `internalSetState`. It will simulate
  // the same API as `setState(updater, callback)`:
  // - updater: (changes object or function that returns the changes object)
  // - callback: Function called after the state has been updated
  // This will call setState with an updater function (a function that receives the state).
  // If the changes are a function, then call that function with the state to get the actual changes
  //
  // 🐨 Call this.props.stateReducer with the `state` and `changes` to get the user changes.
  //
  // 🐨 Then, if the returned value exists and has properties, return that from your updater function.
  // If it does not exist or is an empty object, then return null (avoids an unecessary re-render).
  //
  // 🐨 Pass the callback to the 2nd argument to this.setState
  //
  // 🐨 Finally, update all pre-existing instances of this.setState
  // to this.internalSetState

  void reset() {
    setState(
      getInitialState(),
      () => props.onToggleReset(state.isOn),
    );
  }

  void toggle() {
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  BaseToggleProps getTogglerProps([BaseToggleProps additionalProps]) {
    additionalProps ??= BaseToggleProps();

    return BaseToggleProps()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = mouseEventCallbacks
          .chainFromList([additionalProps.onClick, (_) => toggle()]);
  }

  BaseToggleProps getStateAndHelpers() {
    return BaseToggleProps()
      ..isOn = state.isOn
      ..toggle = toggle
      ..reset = reset
      ..getTogglerProps = getTogglerProps;
  }

  @override
  render() {
    return props.children.single(getStateAndHelpers());
  }
}
