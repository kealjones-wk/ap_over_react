// 09: state reducer with types

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

// FIXME: `ToggleProps` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props(keyNamespace: '')
class _$ToggleProps extends AbstractToggleProps {
  bool initialOn;
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
  Callback2Arg stateReducer;
}

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
  // 💰 any time I use a string as an identifier for a type,
  // I prefer to give it a variable name. That way folks who
  // want to reference the type can do so using variable which
  // will help mitigate the problems of indirection.
  static const stateChangeTypes = {
    'reset': '__toggle_reset__',
    'toggle': '__toggle_toggle__',
  };

  @override
  get initialState => (newState()..isOn = props.initialOn);

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
      ..onClick = mouseEventCallbacks.chainFromList([additionalProps.onClick, (_) => toggle()]);
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
