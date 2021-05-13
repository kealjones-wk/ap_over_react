import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'on.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleOnProps> ToggleOn = castUiFactory(_$ToggleOn);

class ToggleOnProps = UiProps with SharedTogglePropsMixin;

class ToggleOnComponent extends UiComponent2<ToggleOnProps> {
  @override
  get consumedProps => [];

  @override
  render() {
    return null;
  }
}
