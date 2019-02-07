import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/03/context.dart';
// ignore: uri_has_not_been_generated
part 'off.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOffProps> ToggleOff = _$ToggleOff;

@Props()
class _$ToggleOffProps extends AbstractToggleProps {}

@Component()
class ToggleOffComponent extends UiComponent<ToggleOffProps> {
  @override
  Map getDefaultProps() => newProps()..isOn = false;

  @override
  render() {
    return ToggleContext.Consumer()(
      (BaseToggleProps value) {
        return value.isOn ? null : Dom.span()(props.children);
      },
    );
  }
}
