// 10: control props

// ignore_for_file: avoid_positional_boolean_parameters
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';

part 'ap_10.over_react.g.dart';

// Here we're going to simplify our component slightly so you
// can learn the control props pattern in isolation from everything else.
// Next you'll put the pieces together.

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  void Function(bool isOn) onToggle;  
}

@State(keyNamespace: '')
mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  // 🐨 let's add a function that can determine whether
  // the isOn prop is controlled. Call it `isControlled`.
  // It can accept a string called `prop` and should return
  // true if that prop is controlled
  // 💰 this.props[prop] != null

  bool isControlled(String prop) => props[prop] != null;

  //
  // 🐨 Now let's add a function that can return the state
  // whether it's coming from this.state or this.props
  // Call it `getState` and have it return on from
  // state if it's not controlled or props if it is.

  ToggleState getState() { // made more generic
    final combinedState = newState();
    state.forEach((stateMapKey, stateMapValue){
      combinedState[stateMapKey] = isControlled(stateMapKey) ? props[stateMapKey] : stateMapValue;
    });
    return combinedState;
  }

  void toggle(_) {
    // 🐨 if the toggle is controlled, then we shouldn't
    // be updating state. Instead we should just call
    // `this.props.onToggle` with what the state should be
    if (isControlled('isOn')) {
      props.onToggle(!getState().isOn);
    } else {
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(getState().isOn),
    );
    }
  }

  @override
  render() {
    // 🐨 rather than getting state from this.state,
    // let's use our `getState` method.
    return (Switch()
      ..isOn = getState().isOn
      ..onClick = toggle
    )();
  }

  // These extra credit ideas are to expand this solution to elegantly handle
  // more state properties than just a single `on` state.
  // 💯 Make the `getState` function generic enough to support all state in
  // `this.state` even if we add any number of properties to state. ✅
  // 💯 Add support for an `onStateChange` prop which is called whenever any
  // state changes. It should be called with `changes` and `state`
  // 💯 Add support for a `type` property in the `changes` you pass to
  // `onStateChange` so consumers can differentiate different state changes.
}

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final bothOn = useState(false);

    void handleToggle(bool isOn) => bothOn.set(isOn);

    return Dom.div()(
      (Toggle()
        ..isOn = bothOn.value
        ..onToggle = handleToggle
        ..ref = props.toggle1Ref
      )(),
      (Toggle()
        ..isOn = bothOn.value
        ..onToggle = handleToggle
        ..ref = props.toggle2Ref
      )(),
    );
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
  Ref<ToggleComponent> toggle1Ref;
  Ref<ToggleComponent> toggle2Ref;
}
