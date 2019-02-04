// Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/context.dart';
import 'package:ap_over_react/src/shared/abstract_toggle_props.dart';
import 'package:ap_over_react/src/shared/typed_value.dart';

// ignore: uri_has_not_been_generated
part 'toggle_consumer.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleConsumerProps> ToggleConsumer = _$ToggleConsumer;

@Props()
class _$ToggleConsumerProps extends AbstractToggleProps {}

@Component()
class ToggleConsumerComponent extends UiComponent<ToggleConsumerProps> {
  @override
  render() {
    return ToggleContext.Consumer()(
      (TypedValue value) {
        if (value == null) {
          throw new Exception('Toggle compound components cannot be rendered outside the Toggle component');
        }
        return props.children.single(value);
      }
    );
  }
}

// Ignore everything below here: its just temporary dart2 compatibility stuff...

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleConsumerProps extends _$ToggleConsumerProps with _$ToggleConsumerPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleConsumerProps;
}
