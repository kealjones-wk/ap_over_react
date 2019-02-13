// 05: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends AbstractToggleProps {
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

  isControlled(prop) {
    return props[prop] != null;
  }
  // 💯 Make the `getState` function generic enough to support all state in
  // `this.state` even if we add any number of properties to state.
  getState() {
    return BaseToggleProps()
      ..isOn = isControlled('isOn') ? props.isOn : state.isOn;
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
