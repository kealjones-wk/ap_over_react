import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props(keyNamespace: '')
class _$ToggleProps extends AbstractToggleProps {
  Callback1Arg onToggle;
}

@State(keyNamespace: '')
class _$ToggleState extends UiState {
  bool isOn;
}

// 💯 Add support for a `type` property in the `changes` you pass to
// `onStateChange` so consumers can differentiate different state changes.
@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  @override
  Map getInitialState() => newState()..isOn = false;

  isControlled(prop) {
    return props[prop] != null;
  }

  getState() {
    BaseToggleProps combinedState = BaseToggleProps();

    state.forEach((mapKey, mapValue) {
      if (isControlled(mapKey)) {
        combinedState.addAll({
          mapKey: props[mapKey],
        });
      } else {
        combinedState.addAll({
          mapKey: mapValue,
        });
      }
    });
    return combinedState;
  }

  void toggle(_) {
    if (isControlled('isOn')) {
      props.onToggle(!getState().isOn);
    } else {
      setState(
        newState()..isOn = !state.isOn,
        () => props.onToggle(getState().isOn),
      );
    }
  }

  @override
  render() {
    return (Switch()
      ..isOn = getState().isOn
      ..onClick = toggle
    )();
  }
}
