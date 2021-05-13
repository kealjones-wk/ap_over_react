// 10: control props
// this adds support for a `onStateChange` prop

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
  Callback1Arg onStateChange;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

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
      final combinedState = SharedTogglePropsMapView();
      stateParam.forEach((mapKey, mapValue) {
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

    return SharedTogglePropsMapView()..isOn = state.isOn ?? props.isOn;
  }

  internalSetState(changes, callback) {
    Map allChanges;

    getNewState(changes) {
      final combinedState = getState(state);

      // handle function setState call
      final changesObject = ((changes is Function) ? changes(combinedState) : changes) as Map;
      allChanges = changesObject;

      // apply state reducer
      final nonControlledChanges = SharedTogglePropsMapView();

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
        return newState()..isOn = !passedInState.isOn;
      }
      return null;
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
