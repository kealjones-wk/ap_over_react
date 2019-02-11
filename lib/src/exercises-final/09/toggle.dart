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
  getInitialState() => newState()..isOn = props.initialOn;

  internalSetState(changes, callback) {
    setState(() {
       // handle function setState call
      Map changesObject = (changes is Function) ? changes(state) : changes;

      // apply state reducer
      Map reducedChanges = props.stateReducer(state, changesObject) ?? {};

      // remove the type so it's not set into state
      reducedChanges.remove('type');

      BaseToggleProps onlyChanges = BaseToggleProps()..addAll(reducedChanges);

      // return null if there are no changes to be made
      return onlyChanges.isNotEmpty ? onlyChanges : null;
    }, callback);
  }

  reset(_) {
    internalSetState(
      getInitialState()..addAll({'type':stateChangeTypes['reset']}),
      () => props.onToggleReset(state.isOn)
    );
  }

  toggle(map) {
    String type = map['type'] ?? stateChangeTypes['toggle'];
    internalSetState(
      (BaseToggleProps()..isOn = !state.isOn)..addProp('type', type),
      () => props.onToggleReset(state.isOn)
    );
  }

  BaseToggleProps getTogglerProps(props) {
    return BaseToggleProps()
      ..addAll(props)
      ..onClick = mouseEventCallbacks.chainFromList([props.onClick, (_) => toggle])
      ..aria.pressed = state.isOn;
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
