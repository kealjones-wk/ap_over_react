import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/1/toggle_consumer.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
// ignore: uri_has_not_been_generated
part 'off.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOffProps> ToggleOff = _$ToggleOff;

@Props()
class _$ToggleOffProps extends UiProps {}

@Component()
class ToggleOffComponent extends UiComponent<ToggleOffProps> {
  @override
  render() {
    return ToggleConsumer()(
      (BaseToggleProps value) {
        return !value.isOn ? Dom.span()(props.children) : null;
      },
    );
  }
}
