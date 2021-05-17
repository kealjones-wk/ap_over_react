// 03: Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'ap_03.extra_2.over_react.g.dart';

final ToggleContext = createContext<ToggleState>();

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
  Function toggle;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  // The reason we had to move `toggle` above `state` is because
  // in our `state` initialization we're _using_ `this.toggle`. So
  // if `this.toggle` is not defined before state is initialized, then
  // `state.toggle` will be undefined.
  void toggle(_) {
    setState((newState()..isOn = !state.isOn), () => props.onToggle(state.isOn));
  }

  @override
  get initialState => (newState()
    ..isOn = false
    ..toggle = toggle
  );

  static ReactElement On(dynamic children) {
    return ToggleContext.Consumer()(
      (value) {
        if (value == null) {
          throw Exception('Toggle compound components cannot be rendered outside the Toggle component');
        }
        return value.isOn ? children : null;
      },
    );
  }

  static ReactElement Off(dynamic children) {
    return ToggleContext.Consumer()(
      (value) {
        if (value == null) {
          throw Exception('Toggle compound components cannot be rendered outside the Toggle component');
        }
        return value.isOn ? null : children;
      },
    );
  }

  static ReactElement Button() {
    return ToggleContext.Consumer()(
      (value) {
        if (value == null) {
          throw Exception('Toggle compound components cannot be rendered outside the Toggle component');
        }

        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }

  @override
  render() {
    return (ToggleContext.Provider()..value = state)(
      props.children,
    );
  }
}

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');
    return (Toggle()..onToggle = onToggle)(
      ToggleComponent.On('The button is on'),
      ToggleComponent.Off('The button is off'),
      ToggleComponent.Button(),
    );
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
}
