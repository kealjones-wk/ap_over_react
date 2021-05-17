// 02: Compound Components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'ap_02.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

mixin ToggleProps on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
}

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  static ToggleOnProps On() => ToggleOn();

  static ToggleOffProps Off() => ToggleOff();

  static ToggleButtonProps Button() => ToggleButton();

  @override
  get initialState => (newState()..isOn = false);

  void toggle(_) {
    setState((newState()..isOn = !state.isOn), () => props.onToggle(state.isOn));
  }

  @override
  render() {
    var key = 0;
    return Fragment()(
      props.children.map((child) {
        final propsToAdd = SharedTogglePropsMapView()
          ..isOn = state.isOn
          ..toggle = toggle
          ..key = key++;

        return cloneElement(child, propsToAdd);
      }).toList(),
    );
  }
}

class ToggleOnProps = UiProps with SharedTogglePropsMixin;

UiFactory<ToggleOnProps> ToggleOn = uiFunction(
  (props) {
    return props.isOn ? props.children : null;
  },
  _$ToggleOnConfig, // ignore: undefined_identifier
);

class ToggleOffProps = UiProps with SharedTogglePropsMixin;

UiFactory<ToggleOffProps> ToggleOff = uiFunction(
  (props) {
    return props.isOn ? null : props.children;
  },
  _$ToggleOffConfig, // ignore: undefined_identifier
);

class ToggleButtonProps = UiProps with SharedTogglePropsMixin;

UiFactory<ToggleButtonProps> ToggleButton = uiFunction(
  (props) {
    return (Switch()
      ..addUnconsumedDomProps(props, const [])
      ..isOn = props.isOn
      ..onClick = props.toggle
    )();
  },
  _$ToggleButtonConfig, // ignore: undefined_identifier
);

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');
    return (Toggle()..onToggle = onToggle)(
      ToggleComponent.On()('The button is on'),
      ToggleComponent.Off()('The button is off'),
      ToggleComponent.Button()(),
    );
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
}
