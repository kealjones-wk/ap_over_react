import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/1/toggle_consumer.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

// ignore: uri_has_not_been_generated
part 'button.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleButtonProps> ToggleButton = _$ToggleButton;

@Props()
class _$ToggleButtonProps extends UiProps {}

@Component()
class ToggleButtonComponent extends UiComponent<ToggleButtonProps> {
  @override
  render() {
    return ToggleConsumer()(
      (BaseToggleProps value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }
}
