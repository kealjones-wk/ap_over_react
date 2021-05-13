// 03: Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/1/context.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/1/toggle_consumer.dart';
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

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  void toggle(_) {
    setState((newState()..isOn = !state.isOn), () => props.onToggle(state.isOn));
  }

  static On(children) {
    return ToggleConsumer()(
      (value) {
        if (value.isOn) {
          return Dom.span()(children);
        } else {
          return null;
        }
      },
    );
  }

  static Off(children) {
    return ToggleConsumer()(
      (value) {
        if (value.isOn) {
          return null;
        } else {
          return Dom.span()(children);
        }
      },
    );
  }

  static Button() {
    return ToggleConsumer()(
      (value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }

  @override
  render() {
    final tValue = SharedTogglePropsMapView()
      ..isOn = state.isOn
      ..toggle = toggle;
    return (ToggleContext.Provider()..value = tValue)(
      props.children,
    );
  }
}
