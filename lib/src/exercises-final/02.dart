import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/02/02_button.dart';
import 'package:ap_over_react/src/exercises-final/02/02_on.dart';
import 'package:ap_over_react/src/exercises-final/02/02_off.dart';
import 'package:ap_over_react/src/exercises-final/02/abstract_02_props.dart';

// ignore: uri_has_not_been_generated
part '02.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends Abstract02Props {
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
  @override
  Map getInitialState() => (newState()
      ..isOn = false
    );

  @override
  render() {
    int key = 0;
    return Dom.div()(
      props.children.map((child) {
        var propsToAdd = Toggle()
            ..key = key++
            ..toggle = toggle
            ..isOn = state.isOn
            ..addProps(Toggle(getProps(child)));

        return cloneElement(child, propsToAdd);
      }).toList()
    );
  }

  // --------------------------------------------------------------------------
  // Public API Methods
  // --------------------------------------------------------------------------
  void toggle(_){
    setState((newState()
      ..isOn = !state.isOn
      ),
      () {
        props.onToggle(state.isOn);
      }
    );
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
