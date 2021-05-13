// 11: The provider pattern

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/app_components/not_ready.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

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
    return (props.children.single(SharedTogglePropsMapView()
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
