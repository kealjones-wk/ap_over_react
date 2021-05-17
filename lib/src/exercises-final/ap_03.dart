// 03: Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'ap_03.over_react.g.dart';

final tDefaultValue = SharedTogglePropsMapView()
  ..isOn = false
  ..toggle = (_) {
    print('context default onClick');
  };
final ToggleContext = createContext(tDefaultValue);

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
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  static ReactElement On(dynamic children) {
    return ToggleContext.Consumer()(
      (value) {
        return value.isOn ? children : null;
      },
    );
  }

  static ReactElement Off(dynamic children) {
    return ToggleContext.Consumer()(
      (value) {
        return value.isOn ? null : children;
      },
    );
  }

  static ReactElement Button() {
    return ToggleContext.Consumer()(
      (value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }

  void toggle(_) {
    setState((newState()..isOn = !state.isOn), () => props.onToggle(state.isOn));
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
