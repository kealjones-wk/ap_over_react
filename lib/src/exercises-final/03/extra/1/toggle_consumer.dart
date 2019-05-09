// Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/1/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

// ignore: uri_has_not_been_generated
part 'toggle_consumer.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleConsumerProps> ToggleConsumer = _$ToggleConsumer;

@Props()
class _$ToggleConsumerProps extends AbstractToggleProps {}

@Component2()
class ToggleConsumerComponent extends UiComponent2<ToggleConsumerProps> {
  @override
  render() {
    return ToggleContext.Consumer({},
      (BaseToggleProps value) {
        if (value == null) {
          throw new Exception(
              'Toggle compound components cannot be rendered outside the Toggle component');
        }
        return props.children.single(value);
      },
    );
  }
}
