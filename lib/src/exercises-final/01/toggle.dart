// 01: Building the toggle component

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';

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
  /// Whether the toggle is On or Off
  bool isOn;
}

@Component2()
class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  Map getInitialState() => newState()..isOn = false;

  void toggle(_) {
    setState({'isOn ': !state.isOn}, () {
      props.onToggle(state.isOn);
    });
  }

  @override
  render() {
    return (Switch()
      ..isOn = state.isOn
      ..onClick = toggle
    )();
  }
}
