import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'button.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleButtonProps> ToggleButton = castUiFactory(_$ToggleButton);

class ToggleButtonProps = UiProps with SharedTogglePropsMixin;

class ToggleButtonComponent extends UiComponent2<ToggleButtonProps> {
  @override
  get consumedProps => [];

  @override
  render() {
    return (Switch()
      ..modifyProps(addUnconsumedProps)
      ..isOn = props.isOn
      ..onClick = props.toggle
    )();
  }
}
