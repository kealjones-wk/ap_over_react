// 05: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends AbstractToggleProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
  bool initialOn;
  Callback2Arg stateReducer;

}

@State()
class _$ToggleState extends UiState {
  // Wether the toggle is On or Off
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  @override
  Map getDefaultProps() => newProps()
      ..initialOn = false
      ..onToggleReset = (_){}
      ..stateReducer = (state, changes) => changes;

  static const stateChangeTypes = {
    'reset': '__toggle_reset__',
    'toggle': '__toggle_toggle__',
  };

  @override
  Map getInitialState() => newState()..isOn = props.initialOn;

  internalSetState(changes, callback) {
    setState(() {
       // handle function setState call
      Map changesObject = (changes is Function) ? changes(state) : changes;

      // apply state reducer
      Map reducedChanges = props.stateReducer(state, changesObject) ?? {};

      // remove the type so it's not set into state
      Map onlyChanges = reducedChanges..remove('type');

      // return null if there are no changes to be made
      return onlyChanges.isNotEmpty ? onlyChanges : null;
    }, callback);
  }

  void reset() {
    internalSetState(
      getInitialState()..addAll({'type':stateChangeTypes['reset']}),
      () => props.onToggleReset(state.isOn)
    );
  }

  void toggle(Map map) {
    String type = map['type'] ?? stateChangeTypes['toggle'];
    internalSetState(
      (BaseToggleProps()..isOn = !state.isOn)..addProp('type', type),
      () => props.onToggleReset(state.isOn)
    );
  }

  BaseToggleProps getTogglerProps(props) {
    return BaseToggleProps()
      ..addProps(props)
      ..onClick = mouseEventCallbacks.chainFromList([props.onClick, (_) => toggle])
      ..aria.pressed = state.isOn;
  }

  getStateAndHelpers() {
    return BaseToggleProps()
      ..isOn = state.isOn
      ..toggle = this.toggle
      ..reset = this.reset
      ..getTogglerProps = getTogglerProps;
    }
  }

  @override
  render() {
    return (Switch()
        ..isOn = getState().isOn
        ..onClick = toggle
      )();
  }
}
