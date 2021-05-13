// 10: control props
// this adds support for a `onStateChange` prop

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
  Callback1Arg onStateChange;
}

@State(keyNamespace: '')
mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = null);

  isControlled(prop) {
    return props[prop] != null;
  }

  getState([ToggleState stateParam]) {
    if (stateParam != null) {
      BaseToggleProps combinedState = BaseToggleProps();
      ToggleState componentState = stateParam;

      componentState.forEach((mapKey, mapValue) {
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

    return BaseToggleProps()..isOn = state.isOn != null ? state.isOn : props.isOn;
  }

  internalSetState(changes, callback) {
    Map allChanges;

    getNewState(changes) {
      BaseToggleProps combinedState = getState(state);

      // handle function setState call
      Map changesObject = (changes is Function) ? changes(combinedState) : changes;
      allChanges = changesObject;

      // apply state reducer
      BaseToggleProps nonControlledChanges = BaseToggleProps();

      changesObject.forEach((mapKey, mapValue) {
        nonControlledChanges.addAll({
          mapKey: mapValue,
        });
      });

      // return null if there are no changes to be made
      return nonControlledChanges.isNotEmpty ? nonControlledChanges : null;
    }

    setState(getNewState(changes), () {
      props.onStateChange(allChanges['isOn']);
      callback();
    });
  }

  void toggle(_) {
    internalSetState((passedInState) {
      if (passedInState.isOn != null) {
        return {'isOn': !passedInState.isOn};
      }
    }, () => props.onToggle(getState().isOn));
  }

  @override
  render() {
    return (Switch()
      ..isOn = getState().isOn
      ..onClick = toggle
    )();
  }
}
