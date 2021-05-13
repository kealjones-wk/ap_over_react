// 10: control props
// this makes the `getState` function more flexible

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

@State(keyNamespace: '')
mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  isControlled(prop) {
    return props[prop] != null;
  }

  getState() {
    SharedTogglePropsMapView combinedState = SharedTogglePropsMapView();

    state.forEach((mapKey, mapValue) {
      if (isControlled(mapKey)) {
        combinedState.addAll({
          mapKey: props[mapKey],
        });
      } else {
        combinedState.addAll({
          mapKey: mapValue,
        });
      }
    });
    return combinedState;
  }

  void toggle(_) {
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
    return (Switch()
      ..isOn = getState().isOn
      ..onClick = toggle
    )();
  }
}
