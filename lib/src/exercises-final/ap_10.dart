// 10: control props

// ignore_for_file: avoid_positional_boolean_parameters
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'ap_10.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  bool isControlled(String prop) => props[prop] != null;

  ToggleState getState() {
    return newState()..isOn = isControlled('isOn') ? props.isOn : state.isOn;
  }

  void toggle(_) {
    if (isControlled('isOn')) {
      props.onToggle(!getState().isOn);
    } else {
      setState(
        newState()..isOn = !state.isOn,
        () => props.onToggle(getState().isOn),
      );
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

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final bothOn = useState(false);

    void handleToggle(bool isOn) => bothOn.set(isOn);

    return Dom.div()(
      (Toggle()
        ..isOn = bothOn.value
        ..onToggle = handleToggle
        ..ref = props.toggle1Ref
      )(),
      (Toggle()
        ..isOn = bothOn.value
        ..onToggle = handleToggle
        ..ref = props.toggle2Ref
      )(),
    );
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
  Ref<ToggleComponent> toggle1Ref;
  Ref<ToggleComponent> toggle2Ref;
}
