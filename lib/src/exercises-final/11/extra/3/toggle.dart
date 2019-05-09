// 11: The provider pattern
// Extra credit: support render props

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/3/context.dart';
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

@Component2()
class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
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
    final dynamic children = props.children;
    final ui = children is Function ? children(state) : children;

    return ToggleContext.Provider({
      'value': BaseToggleProps()
        ..isOn = state.isOn
        ..toggle = state.toggle,
    }
    )(ui);
  }
}
