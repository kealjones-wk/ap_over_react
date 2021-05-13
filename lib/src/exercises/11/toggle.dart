// 11: The provider pattern

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/app_components/not_ready.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

// FIXME: `ToggleProps` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props()
class _$ToggleProps extends AbstractToggleProps {
  Callback1Arg onToggle;
}

mixin ToggleState on UiState {
  bool isOn;
}

// 🐨 create your React context here with React.createContext
class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  // 🐨 expose the ToggleContext.Consumer as a static property of Toggle here.
  @override
  get initialState => (newState()..isOn = false);

  void toggle(_) {
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  @override
  render() {
    //Before working on the Toggle component in this exercise, it will cause errors
    //When the component is functional (not necessarily complete), it will render
    return (props.children.single(BaseToggleProps()
      ..isOn = state.isOn
      ..toggle = toggle))();
  }
}

// 💯 Extra credit: Add a custom Consumer that validates the
// ToggleContext.Consumer is rendered within a provider
//
// 💯 Extra credit: avoid unecessary re-renders by only updating the value when
// state changes
//
// 💯 Extra credit: support render props as well
//
// 💯 Extra credit: support (and expose) compound components!
