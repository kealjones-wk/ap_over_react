// 02: Compound Components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'on.dart';
import 'off.dart';
import 'button.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  static On() => ToggleOn();

  static Off() => ToggleOff();

  static Button() => ToggleButton();

  @override
  get initialState => (newState()..isOn = false);

  void toggle(_) {
    setState((newState()..isOn = !state.isOn), () => props.onToggle(state.isOn));
  }

  @override
  render() {
    int key = 0;
    return Dom.div()(
      props.children.map((child) {
        var propsToAdd = Toggle()
          ..isOn = state.isOn
          ..toggle = toggle
          ..key = key++;

        return cloneElement(child, propsToAdd);
      }).toList(),
    );
  }
}
