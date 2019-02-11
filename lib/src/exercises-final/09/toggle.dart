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
      if (reducedChanges.containsKey('type')) reducedChanges.remove('type');

      ToggleState onlyChanges = newState()..addAll(reducedChanges);

      // return null if there are no changes to be made
      return onlyChanges.isNotEmpty ? onlyChanges : null;
    }, callback);
  }

  reset(_) {
    internalSetState(
      BaseToggleProps()..addAll(getInitialState())..addAll({'type':stateChangeTypes['reset']}),
      () => props.onToggleReset(state.isOn)
    );
  }

  toggle([Map args = const {}]) {
    print('toggle');
    internalSetState(
      {
        'isOn': !state.isOn,
        'type': args.containsKey('type') ? args['type'] : stateChangeTypes['toggle']
      },
      () => props.onToggle(state.isOn)
    );
  }

  BaseToggleProps getTogglerProps([BaseToggleProps additionalProps]) {
    additionalProps ??= BaseToggleProps();

    var propsToSendBack = BaseToggleProps()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = (_) => toggle;// mouseEventCallbacks.chainFromList([(_) => toggle, additionalProps.onClick]);

    return propsToSendBack;
  }

  BaseToggleProps getStateAndHelpers() {
    return BaseToggleProps()
      ..isOn = state.isOn
      ..toggle = ((_) => toggle())
      ..reset = reset
      ..getTogglerProps = getTogglerProps;
  }

  @override
  render() {
    return props.children.single(getStateAndHelpers());
  }
}
