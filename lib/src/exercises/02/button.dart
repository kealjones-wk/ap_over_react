import 'package:over_react/over_react.dart';
// Uncomment this out when you need it
//import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:react/react_client.dart';

// ignore: uri_has_not_been_generated
part 'button.over_react.g.dart';

var ToggleContext = createContext();
@Factory()
// ignore: undefined_identifier
UiFactory<ToggleButtonProps> ToggleButton = _$ToggleButton;

@Props()
class _$ToggleButtonProps extends AbstractToggleProps {}

@Component2()
class ToggleButtonComponent extends UiComponent2<ToggleButtonProps> {
  @override
  render() {
    return ToggleContext.Consumer(null);
  }
}
