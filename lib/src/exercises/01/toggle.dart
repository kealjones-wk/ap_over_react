import 'package:over_react/over_react.dart';
// 🐨 uncomment this import to get the switch component.
// It takes an `onClick` and an `on` prop
// import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

@State()
class _$ToggleState extends UiState {
  // Wether the toggle is On or Off
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  // 🐨 this toggle component is going to need to have state for `on`
  //
  // You'll also want a method to handle when the switch is clicked
  // which will update the `on` state and call the `onToggle` prop
  // with the new `on` state.
  //
  // 💰 setState(newState, callback)
  //
  // The `callback` should be where you call `props.onToggle(state.isOn)`
  //
  // 💯 Use a state updater function for `newState` to avoid issues with batching
  @override
  Map getInitialState() => newState();

  @override
  render() {
    // 🐨 here you'll want to return the switch with the `on` and `onClick` props
    return null;
  }

  // --------------------------------------------------------------------------
  // Public API Methods
  // --------------------------------------------------------------------------
  void toggle() {
    setState(newState()..isOn = !state.isOn, () {
      props.onToggle(state.isOn);
    });
  }
}

// Ignore everything below here: its just temporary dart2 compatibility stuff...

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleProps extends _$ToggleProps with _$TogglePropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleProps;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleState extends _$ToggleState with _$ToggleStateAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const StateMeta meta = _$metaForToggleState;
}
