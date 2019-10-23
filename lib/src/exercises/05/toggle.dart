// 05: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

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
}

@Component2()
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
      ..toggle = toggle;
    // In our last usage example, you'll notice that we had some
    // common props (`onClick`, and we're also missing `aria-pressed`
    // value on the `button`). Because most users will want these
    // props applied to the button they render, we can add a collection
    // of props as a convenience for them.
    //
    // 🐨 Add a `togglerProps` domProps() object that has an `aria.pressed` (should
    // be set to the value of the `isOn` state), and an `onClick` assigned
    // to the toggle function.
  }

  @override
  render() {
    return props.children.single(getStateAndHelpers());
  }
}
