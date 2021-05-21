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
  // you can create function components as static properties!
  // This is handy because it makes the relationship between the
  // parent Toggle component and the child component more explicit
  // 🐨 You'll need to update the three OverReact function components in this file:
  //        `ToggleOn`, `ToggleOff`, and `ToggleButton`
  //    * ToggleOn should render its children only when the parent state.isOn is true
  //    * ToggleOff should render its children only when the parent state.isOn is false
  //    * ToggleButton will be responsible for rendering the <Switch /> (with the right props)
  // 💰 Combined with changes you'll make in the `render` method, these should
  //    be able to accept `on`, `toggle`, and `children` as props via `SharedTogglePropsMixin`.
  //    Note that they will _not_ have access to Toggle instance properties
  //    like `this.state.on` or `this.toggle`.

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
    // we're trying to let people render the components they want within the Toggle component.
    // But the ToggleOn, ToggleOff, and ToggleButton components will need access to the internal `isOn` state as
    // well as the internal `toggle` function for them to work properly. So here we can
    // take all props.children and make a copy of them that has those props.
    //
    // To do this, you can use:
    // 1. props.children.map
    // 2. cloneElement: https://pub.dev/documentation/over_react/latest/over_react.react_wrappers/cloneElement.html
    //
    // 🐨 you'll want to completely replace the code below with the above logic.
    return (Switch()
      ..isOn = state.isOn
      ..onClick = toggle
    )();
  }
}

class ToggleOnProps = UiProps with SharedTogglePropsMixin;

UiFactory<ToggleOnProps> ToggleOn = uiFunction(
  (props) {
    return null;
  },
  _$ToggleOnConfig, // ignore: undefined_identifier
);

class ToggleOffProps = UiProps with SharedTogglePropsMixin;

UiFactory<ToggleOffProps> ToggleOff = uiFunction(
  (props) {
    return null;
  },
  _$ToggleOffConfig, // ignore: undefined_identifier
);

class ToggleButtonProps = UiProps with SharedTogglePropsMixin;

UiFactory<ToggleButtonProps> ToggleButton = uiFunction(
  (props) {
    return null;
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
