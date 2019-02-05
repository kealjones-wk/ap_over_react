import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/2/toggle_consumer.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
// ignore: uri_has_not_been_generated
part 'on.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOnProps> ToggleOn = _$ToggleOn;

@Props()
class _$ToggleOnProps extends UiProps {}

@Component()
class ToggleOnComponent extends UiComponent<ToggleOnProps> {
  @override
  render() {
    return ToggleConsumer()(
      (BaseToggleProps value) {
        return value.isOn ? Dom.span()(props.children) : null;
      },
    );
  }
}
