// 04: render props

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';

part 'toggle.over_react.g.dart';

// we're back to basics here. Rather than compound components,
// let's use a render prop!
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

mixin ToggleProps on UiProps {
  Callback1Arg onToggle;
}

mixin ToggleState on UiState {
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  void toggle(_) => setState(newState()..isOn = !state.isOn, () => props.onToggle(state.isOn));

  @override
  render() {
    // We want to give rendering flexibility, so we'll be making
    // a change to our render prop component here.
    // You'll notice the children prop in the Usage component
    // is a function. 🐨 So you can replace this with a call this.props.children()
    // But you'll need to pass it an object with `on` and `toggle`.
    return (Switch()
      ..isOn = state.isOn
      ..onClick = toggle
    )();
  }
}
