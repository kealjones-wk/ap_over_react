// 10: control props
// this adds support for a `onStateChange` prop

// ignore_for_file: avoid_positional_boolean_parameters
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'ap_10.extra_2.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
  void Function(bool isOn) onStateChange;
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

  bool isControlled(String prop) => props[prop] != null;

  ToggleState getState([ToggleState stateParam]) {
    final combinedState = newState()..isOn = state.isOn ?? props.isOn;

    stateParam?.forEach((stateMapKey, stateMapValue) {
      combinedState[stateMapKey] = isControlled(stateMapKey) ? props[stateMapKey] : stateMapValue;
    });

    return combinedState;
  }

  void internalSetState(dynamic changes, Function() callback) {
    ToggleState allChanges;

    Map getNewState(dynamic changes) {
      final combinedState = getState(state);

      // handle function setState call
      final changesObject = ((changes is Function) ? changes(combinedState) : changes) as ToggleState;
      allChanges = changesObject;

      // apply state reducer
      final nonControlledChanges = SharedTogglePropsMapView();

      changesObject.forEach((mapKey, mapValue) {
        nonControlledChanges[mapKey] = mapValue;
      });

      return nonControlledChanges;
    }

    final nextState = getNewState(changes);
    if (nextState.isEmpty) return;

    setState(nextState, () {
      props.onStateChange(allChanges.isOn);
      callback();
    });
  }

  void toggle(_) {
    internalSetState((passedInState) {
      if ((passedInState as ToggleState).isOn != null) {
        return newState()..isOn = !(passedInState as ToggleState).isOn;
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

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final bothOn = useState(false);

    void handleToggle(bool isOn) => bothOn.set(isOn);
    void handleStateChange(bool isOn) => bothOn.set(isOn);

    return Dom.div()(
      (Toggle()
        ..isOn = bothOn.value
        ..onToggle = handleToggle
        ..onStateChange = handleStateChange
        ..ref = props.toggle1Ref
      )(),
      (Toggle()
        ..isOn = bothOn.value
        ..onToggle = handleToggle
        ..onStateChange = handleStateChange
        ..ref = props.toggle2Ref
      )(),
    );
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
  void Function(bool isOn) onStateChange;
  Ref<ToggleComponent> toggle1Ref;
  Ref<ToggleComponent> toggle2Ref;
}
