// 10: control props
// Add support for a `type` in the changes so consumers can differentiate the
// different state updates

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

  static const Map stateChangeTypes = {
    'toggle': '__toggle__',
    'toggleOn': '__toggle_on__',
    'toggleOff': '__toggle_off__',
  };

  isControlled(prop) {
    return props[prop] != null;
  }

  SharedTogglePropsMixin getState([ToggleState stateParam]) {
    if (stateParam != null) {
      SharedTogglePropsMapView combinedState = SharedTogglePropsMapView();
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
    return SharedTogglePropsMapView()..isOn = state.isOn != null ? state.isOn : props.isOn;
  }

  internalSetState(changes, callback) {
    Map allChanges;

    getNewState(passedInChanges) {
      SharedTogglePropsMapView combinedState = getState(state);

      Map changesObject = (passedInChanges is Function) ? passedInChanges(combinedState) : passedInChanges;
      allChanges = changesObject;

      Map onlyChanges = Map.from(changesObject);
      onlyChanges.remove('type');

      SharedTogglePropsMapView nonControlledChanges = SharedTogglePropsMapView();

      onlyChanges.forEach((mapKey, mapValue) {
        if (!isControlled(mapKey)) {
          nonControlledChanges.addAll({
            mapKey: mapValue,
          });
        }
      });

      // return null if there are no changes to be made
      return nonControlledChanges.isNotEmpty ? nonControlledChanges : null;
    }

    setState(getNewState(changes), () {
      props.onStateChange(allChanges);
      callback();
    });
  }

  void toggle([newState, type]) {
    type ??= ToggleComponent.stateChangeTypes['toggle'];

    internalSetState((passedInState) {
      bool onValue = newState is bool ? newState : passedInState.isOn != null ? !passedInState.isOn : {};
      return {
        'isOn': onValue,
        'type': type,
      };
    }, () => props.onToggle(getState().isOn));
  }

  void handleSwitchClick(_) {
    toggle();
  }

  void handleOffClick(_) {
    toggle(false, ToggleComponent.stateChangeTypes['toggleOff']);
  }

  void handleOnClick(_) {
    toggle(true, ToggleComponent.stateChangeTypes['toggleOn']);
  }

  @override
  render() {
    return Dom.div()(
      (Switch()
        ..isOn = getState().isOn
        ..onClick = handleSwitchClick
      )(),
      Dom.hr()(),
      (Dom.button()
        ..addProps(SharedTogglePropsMapView()
          ..id = 'custom-button-id'
          ..onClick = handleOffClick
          ..aria.label = 'custom-button'
        )
      )(
        'Off',
      ),
      (Dom.button()
        ..addProps(SharedTogglePropsMapView()
          ..id = 'custom-button-id'
          ..onClick = handleOnClick
          ..aria.label = 'custom-button'
        )
      )(
        'On',
      ),
    );
  }
}
