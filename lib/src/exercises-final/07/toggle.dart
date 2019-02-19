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
  // Wether the toggle is On or Off
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  @override
  Map getDefaultProps() => newProps()
    ..initialOn = false
    ..onToggleReset = (_) {};

  @override
  Map getInitialState() => newState()..isOn = props.initialOn;

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
