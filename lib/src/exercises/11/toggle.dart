import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/exercises/11/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends AbstractToggleProps {
  Callback1Arg onToggle;
}

@State()
class _$ToggleState extends UiState {
  bool isOn;
}

// 🐨 create your React context here with React.createContext
@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  // 🐨 expose the ToggleContext.Consumer as a static property of Toggle here.
  @override
  Map getInitialState() => newState()..isOn = false;

  void toggle(_) {
    setState(
      newState()..isOn = !state.isOn,
          () => props.onToggle(state.isOn),
    );
  }

  @override
  render() {
    return (
        props.children.single(
          BaseToggleProps()
            ..isOn = state.isOn
            ..toggle = toggle
        )
    )();
  }
}

// 💯 Extra credit: Add a custom Consumer that validates the
// ToggleContext.Consumer is rendered within a provider
//
// 💯 Extra credit: avoid unecessary re-renders by only updating the value when
// state changes
//
// 💯 Extra credit: support render props as well
//
// 💯 Extra credit: support (and expose) compound components!

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.