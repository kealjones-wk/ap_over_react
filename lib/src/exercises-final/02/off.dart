import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'off.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOffProps> ToggleOff = _$ToggleOff;

// FIXME: `ToggleOffProps` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props()
class _$ToggleOffProps extends AbstractToggleProps {}

@Component2()
class ToggleOffComponent extends UiComponent2<ToggleOffProps> {
  @override
  render() {
    return props.isOn ? null : Dom.span()(props.children);
  }
}
