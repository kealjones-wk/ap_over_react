// Prop Getters

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props(keyNamespace: '')
class _$ToggleProps extends AbstractToggleProps {
  bool initialOn;
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
  Callback2Arg stateReducer;
}

@State(keyNamespace: '')
class _$ToggleState extends UiState {
  // Wether the toggle is On or Off
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {

  @override
  Map getDefaultProps() => newProps()
      ..initialOn = false
      ..onToggleReset = (_) {}
      ..stateReducer = (state, changes) => changes;

  @override
  Map getInitialState() => newState()..isOn = props.initialOn;

  internalSetState(changes, callback) {
    getNewState(changes) {
       // handle function setState call
      Map changesObject = (changes is Function) ? changes(state) : changes;

      // apply state reducer
      Map onlyChanges = props.stateReducer(state, changesObject) ?? {};

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

  BaseToggleProps getTogglerProps([BaseToggleProps additionalProps]) {
    additionalProps ??= BaseToggleProps();

    return BaseToggleProps()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = mouseEventCallbacks.chainFromList([additionalProps.onClick, (_) => toggle()]);
  }

  BaseToggleProps getStateAndHelpers(){
    return BaseToggleProps()
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
