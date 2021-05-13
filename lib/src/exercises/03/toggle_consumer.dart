// Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises/03/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'toggle_consumer.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleConsumerProps> ToggleConsumer = castUiFactory(_$ToggleConsumer);

class ToggleConsumerProps = UiProps with SharedTogglePropsMixin;

class ToggleConsumerComponent extends UiComponent2<ToggleConsumerProps> {
  @override
  get consumedProps => [];

  @override
  render() {
    return ToggleContext.Consumer()(
      (value) {
        if (value == null) {
          throw Exception('Toggle compound components cannot be rendered outside the Toggle component');
        }
        return props.children.single(value);
      },
    );
  }
}
