// 10: control props
// this makes the `getState` function more flexible

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

// FIXME: `ToggleProps` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props(keyNamespace: '')
class _$ToggleProps extends AbstractToggleProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

@State(keyNamespace: '')
mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

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
