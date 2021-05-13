// 11: The provider pattern
// Extra credit: support render props

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/3/context.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

// FIXME: `ToggleProps` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props()
class _$ToggleProps extends AbstractToggleProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
  Callback1Arg toggle;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()
    ..isOn = false
    ..toggle = toggle
  );

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

    return (ToggleContext.Provider()
      ..value = (BaseToggleProps()
        ..isOn = state.isOn
        ..toggle = state.toggle)
    )(ui);
  }
}
