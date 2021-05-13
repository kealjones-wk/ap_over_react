// 09: state reducer with types

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  bool initialOn;

  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
  Map Function(Map state, Map changes) stateReducer;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

@State(keyNamespace: '')
mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get defaultProps => (newProps()
    ..initialOn = false
    ..onToggleReset = (_) {}
    ..stateReducer = (state, changes) => changes
  );

  @override
  get initialState => (newState()..isOn = props.initialOn);

  internalSetState(changes, callback) {
    getNewState(changes) {
      // handle function setState call
      final changesObject = ((changes is Function) ? changes(state) : changes) as Map;

      // apply state reducer
      final onlyChanges = props.stateReducer(state, changesObject) ?? const {};

      // 🐨  in addition to what we've done, let's pluck off the `type`
      // property and return an object only if the state changes
      // 💰 to remove the `type`, you can destructure the changes:
      // `{type, ...c}`
      return onlyChanges.isNotEmpty ? onlyChanges : null;
    }

    setState(getNewState(changes), callback);
  }

  void reset() {
    // 🐨 add a `type` string property to this call
    internalSetState(
      getInitialState(),
      () => props.onToggleReset(state.isOn),
    );
  }

  // 🐨 accept a `type` property here and give it a default value
  void toggle() {
    // pass the `type` string to this object
    internalSetState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  SharedTogglePropsMapView getTogglerProps([SharedTogglePropsMapView additionalProps]) {
    additionalProps ??= SharedTogglePropsMapView();

    return SharedTogglePropsMapView()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = mouseEventCallbacks.chainFromList([additionalProps.onClick, (_) => toggle()]);
  }

  SharedTogglePropsMapView getStateAndHelpers() {
    return SharedTogglePropsMapView()
      ..isOn = state.isOn
      ..toggle = toggle
      ..reset = reset
      ..getTogglerProps = getTogglerProps;
  }

  @override
  render() {
    return props.children.single(getStateAndHelpers());
  }
}
