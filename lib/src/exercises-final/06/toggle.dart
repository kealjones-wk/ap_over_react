// 06: prop getters

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
  Map getInitialState() => newState()..isOn = false;

  void toggle(_) {
    setState(
      newState()..isOn = !state.isOn,
      () {
        print('toggle');
        props.onToggle(state.isOn);
      },
    );
  }

  BaseToggleProps getTogglerProps([BaseToggleProps additionalProps]) {
    additionalProps ??= BaseToggleProps();

    var propsToSendBack = BaseToggleProps()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick =
          mouseEventCallbacks.chainFromList([toggle, additionalProps.onClick]);

    return propsToSendBack;
  }

  BaseToggleProps getStateAndHelpers() {
    return BaseToggleProps()
      ..isOn = state.isOn
      ..toggle = toggle
      ..getTogglerProps = getTogglerProps;
  }

  @override
  render() {
    return props.children.single(getStateAndHelpers());
  }
}
