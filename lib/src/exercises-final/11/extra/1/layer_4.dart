// 11: The provider pattern
// Extra credit: Validate the consumer is rendered within a provider

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/1/toggle_consumer.dart';
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
    return ToggleConsumer()(
      (value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }
}
