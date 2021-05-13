import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'off.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleOffProps> ToggleOff = castUiFactory(_$ToggleOff);

class ToggleOffProps = UiProps with SharedTogglePropsMixin;

class ToggleOffComponent extends UiComponent2<ToggleOffProps> {
  @override
  get consumedProps => [];

  @override
  render() {
    return null;
  }
}
