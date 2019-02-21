// 12: Higher order components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/12/context.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/4/toggle_consumer.dart';
// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends AbstractToggleProps {

}

@State()
class _$ToggleState extends UiState {
  // Whether the toggle is On or Off
  bool isOn;

  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {

  @override
  Map getInitialState() => newState()
    ..isOn = false
    ..onToggle = toggle;

  void toggle(_) {
    setState(
      newState()..isOn = !state.isOn,
          () => state.onToggle(state.isOn),
    );
  }

  static withToggle(component) {
    Wrapper() {
      return ToggleContext.Consumer()(
        (BaseToggleProps value) {
          (component()
            ..toggle = value.toggle
            ..ref = value.ref
          )();
        }
      );
    }
    return Wrapper();
  }

  @override
  render() {
    return ToggleContext.Provider({
      'value': BaseToggleProps()
        ..isOn = state.isOn
        ..toggle = state.onToggle
        ..ref = (ref) {
          props.ref = ref;
        }
    })(props.children);
  }
}

