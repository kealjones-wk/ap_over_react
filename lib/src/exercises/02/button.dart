import 'package:over_react/over_react.dart';
// Uncomment this out when you need it
//import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:over_react/over_react.dart';

part 'button.over_react.g.dart';

var ToggleContext = createContext();
@Factory()
// ignore: undefined_identifier
UiFactory<ToggleButtonProps> ToggleButton = _$ToggleButton;

// FIXME: `ToggleButtonProps` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props()
class _$ToggleButtonProps extends AbstractToggleProps {}

@Component2()
class ToggleButtonComponent extends UiComponent2<ToggleButtonProps> {
  @override
  render() {
    return ToggleContext.Consumer(null);
  }
}
