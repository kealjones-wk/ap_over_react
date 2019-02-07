import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/03/context.dart';

// ignore: uri_has_not_been_generated
part 'button.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleButtonProps> ToggleButton = _$ToggleButton;

@Props()
class _$ToggleButtonProps extends AbstractToggleProps {}

@Component()
class ToggleButtonComponent extends UiComponent<ToggleButtonProps> {
  @override
  render() {
    return ToggleContext.Consumer()(
      (BaseToggleProps value) {
        return (Switch()
          ..addProps(copyUnconsumedProps())
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }
}
