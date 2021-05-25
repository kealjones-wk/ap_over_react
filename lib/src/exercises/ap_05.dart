// 05: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'ap_05.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

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

  void toggle(_) => setState(newState()..isOn = !state.isOn, () => props.onToggle(state.isOn));

  @override
  render() {
    return props.children.single(
        // In our last usage example, you'll notice that we had some
        // common props (`onClick`, and we're also missing `aria-pressed`
        // value on the `button`). Because most users will want these
        // props applied to the button they render, we can add a collection
        // of props as a convenience for them.
        //
        // 🐨 Add a `togglerProps` domProps() object that has an `aria.pressed` (should
        // be set to the value of the `isOn` state), and an `onClick` assigned
        // to the toggle function.
        SharedTogglePropsMapView()
          ..isOn = state.isOn
          ..toggle = toggle
          ..togglerProps = (domProps()
            ..aria.pressed = state.isOn
            ..onClick = toggle
          ));
  }
}

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');

    renderer(SharedTogglePropsMixin value) {
      return Dom.div()(
        value.isOn ? 'The button is on' : 'The button is off',
        (Switch()
          ..addProps(value.togglerProps)
          ..isOn = value.isOn
        )(),
        Dom.hr()(),
        (Dom.button()
          ..addProps(value.togglerProps)
          ..aria.label = 'custom-button'
        )(
          value.isOn ? 'on' : 'off',
        ),
      );
    }

    return (Toggle()..onToggle = onToggle)(renderer);
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
}
