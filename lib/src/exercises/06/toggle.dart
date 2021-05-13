// 06: prop getters

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'toggle.over_react.g.dart';

// Check out the previous usage example. How would someone pass
// a custom `onClick` handler? It'd be pretty tricky! It'd be
// easier to just not use the `togglerProps` prop collection!
//
// What if instead we exposed a function which merged props?
// Let's do that instead. 🐨 Swap `togglerProps` with a `getTogglerProps`
// function. It should accept props and merge the provided props
// with the ones we need to get our toggle functionality to work
//
// 💰 Here's a little utility that might come in handy
// dynamic _callAll(dynamic fns){
//    return mouseEventCallbacks.chainFromList(fns);
//  }

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
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  void toggle(_) {
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  BaseToggleProps getStateAndHelpers() {
    return BaseToggleProps()
      ..isOn = state.isOn
      ..toggle = toggle
      ..togglerProps = (domProps()
        ..aria.pressed = state.isOn
        ..onClick = toggle);
  }

  @override
  render() {
    return props.children.single(getStateAndHelpers());
  }
}
