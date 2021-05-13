// 11: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises/11/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'layer_4.over_react.g.dart';

// Don't make changes to the Layer4 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<Layer4Props> Layer4 = castUiFactory(_$Layer4);

class Layer4Props = UiProps with SharedTogglePropsMixin;

class Layer4Component extends UiComponent2<Layer4Props> {
  @override
  get consumedProps => [];

  @override
  render() {
    return ToggleContext.Consumer()(
      (value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }
}
