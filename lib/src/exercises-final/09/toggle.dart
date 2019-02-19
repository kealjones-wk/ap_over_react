// 09: state reducer with types

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
  // Whether the toggle is On or Off
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  @override
  Map getDefaultProps() => newProps()
    ..initialOn = false
    ..onToggleReset = (_) {}
    ..stateReducer = (state, changes) => changes;

  static const stateChangeTypes = {
    'reset': '__toggle_reset__',
    'toggle': '__toggle_toggle__',
  };

  @override
  Map getInitialState() => newState()..isOn = props.initialOn;

  internalSetState(changes, callback) {
    getNewState(changes) {
      // handle function setState call
      Map changesObject = (changes is Function) ? changes(state) : changes;

      // apply state reducer
      Map reducedChanges = props.stateReducer(state, changesObject) ?? {};

      // remove the type so it's not set into state
      if (reducedChanges.containsKey('type')) {
        reducedChanges.remove('type');
      }

      Map onlyChanges = reducedChanges;
      print(onlyChanges);
      // return null if there are no changes to be made
      return onlyChanges.isNotEmpty ? onlyChanges : null;
    }

    setState(getNewState(changes), callback);
  }

  void reset() {
    internalSetState(
      getInitialState()..addAll({'type': stateChangeTypes['reset']}),
      () => props.onToggleReset(state.isOn),
    );
  }

  void toggle([Map map]) {
    String type = stateChangeTypes['toggle'];
    if (map != null && map.containsKey('type')) {
      type = map['type'];
    }
    internalSetState(
      BaseToggleProps()
        ..addAll({'type': type})
        ..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  BaseToggleProps getTogglerProps([BaseToggleProps additionalProps]) {
    additionalProps ??= BaseToggleProps();

    return BaseToggleProps()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = mouseEventCallbacks
          .chainFromList([additionalProps.onClick, (_) => toggle()]);
  }

  BaseToggleProps getStateAndHelpers() {
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
