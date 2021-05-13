import 'package:over_react/over_react.dart';
// Uncomment this out when you need it
//import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:over_react/over_react.dart';

part 'button.over_react.g.dart';

var ToggleContext = createContext();
// ignore: undefined_identifier
UiFactory<ToggleButtonProps> ToggleButton = castUiFactory(_$ToggleButton);

class ToggleButtonProps = UiProps with SharedTogglePropsMixin;

class ToggleButtonComponent extends UiComponent2<ToggleButtonProps> {
  @override
  get consumedProps => [];

  @override
  render() {
    return ToggleContext.Consumer(null);
  }
}
