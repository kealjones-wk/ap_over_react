// 08: state reducer

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

  @override
  get initialState => (newState()..isOn = props.initialOn);

  internalSetState(changes, callback) {
    getNewState(changes) {
      // handle function setState call
      Map changesObject = (changes is Function) ? changes(state) : changes;

      // apply state reducer
      Map onlyChanges = props.stateReducer(state, changesObject) ?? {};

      // return null if there are no changes to be made
      return onlyChanges.isNotEmpty ? onlyChanges : null;
    }

    setState(getNewState(changes), callback);
  }

  void reset() {
    internalSetState(
      getInitialState(),
      () => props.onToggleReset(state.isOn),
    );
  }

  void toggle() {
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
