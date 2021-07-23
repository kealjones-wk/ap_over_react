// 07: State Initializers

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'ap_07.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

mixin TogglePropsMixin on UiProps {
  bool initialOn;
  void Function(bool isOn) onToggle;
  void Function(bool isOn) onToggleReset;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  // 🐨 We're going to need some `defaultProps` here to allow
  // people to pass a `initialOn` prop.
  @override
  get defaultProps => (newProps()
    ..initialOn = false
    ..onToggleReset = (_){}
  );

  // 🐨 Rather than initializing state to have on as false,
  // set on to this.props.initialOn
  @override
  get initialState => (newState()..isOn = props.initialOn);

  // 🐨 now let's add a reset method here that resets the state
  // to the initial state. Then add a callback that calls
  // this.props.onReset with the `on` state.
  void reset() {
    setState(initialState, () => props.onToggleReset(state.isOn));
  }

  void toggle(_) => setState(newState()..isOn = !state.isOn, () => props.onToggle(state.isOn));

  SharedTogglePropsMixin getTogglerProps([SharedTogglePropsMixin additionalProps]) {
    additionalProps ??= SharedTogglePropsMapView();

    return SharedTogglePropsMapView()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      // 🐨 now let's include the reset method here
      // so folks can use that in their implementation.
      ..onClick = mouseEventCallbacks.chainFromList([toggle, additionalProps.onClick]);
  }

  @override
  render() {
    return props.children.single(SharedTogglePropsMapView()
      ..isOn = state.isOn
      ..toggle = toggle
      // 🐨 now let's include the reset method here
      // so folks can use that in their implementation.
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

    renderer(SharedTogglePropsMixin value) {
      return Dom.div()(
        value.isOn ? 'The button is on' : 'The button is off',
        (Switch()..addProps(value.getTogglerProps(SharedTogglePropsMapView()..isOn = value.isOn)))(),
        Dom.hr()(),
        (Dom.button()
          ..onClick = (_) {
            value.reset();
          }
        )('Reset'),
      );
    }

    return (Toggle()
      ..initialOn = false
      ..onToggle = onToggle
      ..onToggleReset = onToggleReset
    )(renderer);
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
  void Function(bool isOn) onToggleReset;
}
