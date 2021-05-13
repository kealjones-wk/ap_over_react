// 07: State Initializers

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  bool initialOn;
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get defaultProps => (newProps()
    ..initialOn = false
    ..onToggleReset = (_) {}
  );

  @override
  get initialState => (newState()..isOn = props.initialOn);

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

  SharedTogglePropsMapView getTogglerProps([SharedTogglePropsMapView additionalProps]) {
    additionalProps ??= SharedTogglePropsMapView();

    return SharedTogglePropsMapView()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = mouseEventCallbacks.chainFromList([additionalProps.onClick, (_) => toggle()]);
  }

  SharedTogglePropsMapView getStateAndHelpers() {
    return SharedTogglePropsMapView()
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
