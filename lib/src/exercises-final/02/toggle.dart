// 02: Compound Components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props(keyNamespace: '')
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
    setState({'isOn ': !state.isOn}, () => props.onToggle(state.isOn));
  }

  @override
  render() {
    int key = 0;
    return Dom.div()(
      props.children.map((child) {
        var propsToAdd = Toggle()
          ..isOn = state.isOn
          ..toggle = toggle
          ..key = key++;

        return cloneElement(child, propsToAdd);
      }).toList(),
    );
  }
}
