// 07: State Initializers

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props(keyNamespace: '')
class _$ToggleProps extends AbstractToggleProps {
  bool initialOn;
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
}

@State()
class _$ToggleState extends UiState {
  // 🐨 We're going to need some static defaultProps here to allow
  // people to pass a `initialOn` prop.
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  // 🐨 Rather than initializing state to have on as false,
  // set on to this.props.initialOn
  @override
  Map getInitialState() => newState()..isOn = false;

  void toggle() {
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  // 🐨 now let's add a reset method here that resets the state
  // to the initial state. Then add a callback that calls
  // this.props.onReset with the `on` state.

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
      // 🐨 now let's include the reset method here
      // so folks can use that in their implementation.
      ..getTogglerProps = getTogglerProps;
  }

  @override
  render() {
    return props.children.single(getStateAndHelpers());
  }
}
