// 10: control props
// Add support for a `type` in the changes so consumers can differentiate the
// different state updates

// ignore_for_file: avoid_positional_boolean_parameters
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'ap_10.extra_3.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
  void Function(ToggleState changes) onStateChange;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

@State(keyNamespace: '')
mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  static const Map stateChangeTypes = {
    'toggle': '__toggle__',
    'toggleOn': '__toggle_on__',
    'toggleOff': '__toggle_off__',
  };

  bool isControlled(String prop) => props[prop] != null;

  ToggleState getState([ToggleState stateParam]) {
    final combinedState = newState()..isOn = stateParam?.isOn ?? props.isOn;

    stateParam?.forEach((stateMapKey, stateMapValue) {
      combinedState[stateMapKey] = isControlled(stateMapKey) ? props[stateMapKey] : stateMapValue;
    });

    return combinedState;
  }

  void internalSetState(dynamic changes, Function() callback) {
    ToggleState allChanges;

    Map getNewState(dynamic passedInChanges) {
      final combinedState = getState(state);

      final changesObject =
          ((passedInChanges is Function) ? passedInChanges(combinedState) : passedInChanges) as ToggleState;
      allChanges = changesObject;

      final onlyChanges = Map.of(changesObject)..remove('type');

      final nonControlledChanges = newState();

      onlyChanges.forEach((mapKey, mapValue) {
        if (!isControlled(mapKey)) {
          nonControlledChanges[mapKey] = mapValue;
        }
      });

      return nonControlledChanges;
    }

    final nextState = getNewState(changes);
    if (nextState.isEmpty) return;

    setState(nextState, () {
      props.onStateChange(allChanges);
      callback();
    });
  }

  void toggle([dynamic nextState, String type]) {
    nextState ??= newState();
    type ??= ToggleComponent.stateChangeTypes['toggle'];

    internalSetState((passedInState) {
      final onValue = nextState is bool
          ? nextState
          : (passedInState as ToggleState).isOn != null ? !(passedInState as ToggleState).isOn : const {};
      return newState()
        ..isOn = onValue
        ..['type'] = type;
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
        ..id = 'custom-button-id'
        ..onClick = handleOffClick
        ..aria.label = 'custom-button'
      )('Off'),
      (Dom.button()
        ..id = 'custom-button-id-2'
        ..onClick = handleOnClick
        ..aria.label = 'custom-button-2'
      )('On'),
    );
  }
}

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final onStateChange = props.onStateChange ??
        (_) {
          print('onStateChange');
        };
    final onToggle = props.onToggle ??
        (args) {
          print('onToggle $args');
        };
    final bothOn = useState(false);
    final lastWasButton = useRef(false);

    void handleStateChange(ToggleState changes) {
      // TODO (adl): Need to debug this/ figure out what the expected behavior from the JS demo is supposed to be...
      final isButtonChange = changes['type'] == ToggleComponent.stateChangeTypes['toggleOn'] ||
          changes['type'] == ToggleComponent.stateChangeTypes['toggleOff'];

      if (isButtonChange) {
        bothOn.set(false);
      }

      if (changes['type'] == ToggleComponent.stateChangeTypes['toggle'] || (lastWasButton.current && isButtonChange)) {
        lastWasButton.current = false;
        bothOn.set(changes.isOn);
      } else {
        lastWasButton.current = isButtonChange;
      }

      onStateChange.call(changes);
    }

    return Dom.div()(
      (Toggle()
        ..isOn = bothOn.value
        ..onToggle = onToggle
        ..onStateChange = handleStateChange
        ..ref = props.toggle1Ref
      )(),
      (Toggle()
        ..isOn = bothOn.value
        ..onToggle = onToggle
        ..onStateChange = handleStateChange
        ..ref = props.toggle2Ref
      )(),
    );
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
  void Function(ToggleState changes) onStateChange;
  Ref<ToggleComponent> toggle1Ref;
  Ref<ToggleComponent> toggle2Ref;
}
