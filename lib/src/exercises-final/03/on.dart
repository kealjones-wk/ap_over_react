import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/03/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
// ignore: uri_has_not_been_generated
part 'on.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOnProps> ToggleOn = _$ToggleOn;

@Props()
class _$ToggleOnProps extends AbstractToggleProps {}

@Component()
class ToggleOnComponent extends UiComponent<ToggleOnProps> {
  @override
  Map getDefaultProps() => newProps()..isOn = false;

  @override
  render() {
    return ToggleContext.Consumer()(
      (BaseToggleProps value) {
        return value.isOn ? Dom.span()(props.children) : null;
      },
    );
  }
}
