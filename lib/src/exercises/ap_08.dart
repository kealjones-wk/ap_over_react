// 08: state reducer

// ignore_for_file: avoid_positional_boolean_parameters
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'ap_08.over_react.g.dart';

// Render props allow users to be in control over the UI based on state.
// State reducers allow users to be in control over logic based on actions.
// This idea is similar to redux works, but only coincidentally.
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

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  bool initialOn;
  void Function(bool isOn) onToggle;
  void Function(bool isOn) onToggleReset;
  Map Function(Map state, Map changes) stateReducer;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

@State(keyNamespace: '')
mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get defaultProps => (newProps()
        ..initialOn = false
        ..onToggleReset = (_) {}
      // 🐨 let's add a default stateReducer here. It should return
      // the changes object as it is passed.
  );

  @override
  get initialState => (newState()..isOn = props.initialOn);
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
    setState(initialState, () => props.onToggleReset(state.isOn));
  }

  void toggle(_) => setState(newState()..isOn = !state.isOn, () => props.onToggle(state.isOn));

  SharedTogglePropsMixin getTogglerProps([SharedTogglePropsMixin additionalProps]) {
    additionalProps ??= SharedTogglePropsMapView();

    return SharedTogglePropsMapView()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = mouseEventCallbacks.chainFromList([toggle, additionalProps.onClick]);
  }

  @override
  render() {
    return props.children.single(SharedTogglePropsMapView()
      ..isOn = state.isOn
      ..toggle = toggle
      ..reset = reset
      ..getTogglerProps = getTogglerProps);
  }
}

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final onToggleReset = props.onToggleReset ?? (isOn) => print('onToggleReset $isOn');
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');
    final timesClicked = useState(0);

    void handleToggle(bool isOn) {
      timesClicked.setWithUpdater((t) => t + 1);
      onToggle(isOn);
    }

    void handleReset(bool isOn) {
      timesClicked.set(0);
      onToggleReset(isOn);
    }

    renderer(SharedTogglePropsMixin value) {
      return Dom.div()(
        value.isOn ? 'The button is on' : 'The button is off',
        (Switch()..addProps(value.getTogglerProps(SharedTogglePropsMapView()..isOn = value.isOn)))(),
        timesClicked.value > 4
            ? (Dom.div()..addTestId('notice'))(
                'Whoa, you clicked too much!',
                Dom.br()(),
              )
            : (Dom.div()..addTestId('click-count'))(
                'Click count: ${timesClicked.value}',
              ),
        (Dom.button()
          ..onClick = (_) {
            value.reset();
          }
        )('Reset'),
      );
    }

    Map toggleStateReducer(Map newState, Map changes) {
      if (timesClicked.value >= 4) {
        return SharedTogglePropsMapView()
          ..addAll(changes)
          ..isOn = false;
      }
      return changes;
    }

    return (Toggle()
      ..stateReducer = toggleStateReducer
      ..onToggle = handleToggle
      ..onToggleReset = handleReset
    )(renderer);
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
  void Function(bool isOn) onToggleReset;
}
