// 04: render props

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

// we're back to basics here. Rather than compound components,
// let's use a render prop!
@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends UiProps {
  Callback1Arg onToggle;
}

@State()
class _$ToggleState extends UiState {
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {

  @override
  Map getInitialState() => newState()..isOn = false;

  void toggle(_) => setState(
    newState()..isOn = !state.isOn,
    () => props.onToggle(state.isOn)
  );

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
