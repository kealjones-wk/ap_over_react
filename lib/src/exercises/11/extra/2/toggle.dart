import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/app_components/not_ready.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

// 💯 Extra credit: avoid unecessary re-renders by only updating the value when
// state changes

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
    //Before working on the Toggle component in this exercise, it will cause errors
    //When the component is functional (not necessarily complete), it will render
    try {
      return (props.children.single(BaseToggleProps()
        ..isOn = state.isOn
        ..toggle = toggle))();
    } catch (_) {
      return (NotReady())();
    }
  }
}
