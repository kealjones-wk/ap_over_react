// 11: The provider pattern
// Extra credit: avoid unecessary re-renders by only updating the value when
// state changes

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/2/context.dart';
// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends AbstractToggleProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

@State()
class _$ToggleState extends UiState {
  // Whether the toggle is On or Off
  bool isOn;
  Callback1Arg toggle;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  @override
  Map getInitialState() {
    return newState()
      ..isOn = false
      ..toggle = toggle;
  }

  void toggle(_) {
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  @override
  render() {
    return ToggleContext.Provider({
      'value': BaseToggleProps()
        ..isOn = state.isOn
        ..toggle = state.toggle,
    }
    )(props.children);
  }
}
