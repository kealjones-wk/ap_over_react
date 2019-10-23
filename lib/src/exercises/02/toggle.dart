// 02: Compound Components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'on.dart';
import 'off.dart';
import 'button.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

@State()
class _$ToggleState extends UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

@Component2()
class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  // In OverReact we dont yet support functional components (maybe soon!).
  // So this tutorial is a little more verbose than the video will go though.
  // SubComponents are handy because it makes the relationship between the
  // parent Toggle component and the child component more explicit
  // 🐨 You'll need to create three such components here: ToggleOn, ToggleOff, and ToggleButton
  //    The button will be responsible for rendering the <Switch /> (with the right props)
  // 💰 Combined with changes you'll make in the `render` method, these should
  //    be able to accept `isOn`, `toggle`, and `children` as props.
  //    Note that they will _not_ have access to Toggle instance properties
  //    like `this.state.isOn` or `this.toggle`. The base files for the OverReact components
  //    have been setup and imported to the usage file already. You just need to go and update them:
  //    src/exercises/02/button.dart
  //    src/exercises/02/on.dart
  //    src/exercises/02/off.dart

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
    // we're trying to let people render the components they want within the Toggle component.
    // But the ToggleOn, ToggleOff, and ToggleButton components will need access to the internal `isOn` state as
    // well as the internal `toggle` function for them to work properly. So here we can
    // take all props.children and make a copy of them that has those props.
    //
    // To do this, you can use:
    // 1. props.children.map
    // 2. cloneElement: https://pub.dartlang.org/documentation/over_react/1.24.1/over_react/cloneElement.html
    //
    // 🐨 you'll want to completely replace the code below with the above logic.
    return (Switch()
      ..isOn = state.isOn
      ..onClick = toggle
    )();
  }
}
