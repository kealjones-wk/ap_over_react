// Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'toggle_consumer.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleConsumerProps> ToggleConsumer = _$ToggleConsumer;

// FIXME: `ToggleConsumerProps` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props()
class _$ToggleConsumerProps extends AbstractToggleProps {}

@Component2()
class ToggleConsumerComponent extends UiComponent2<ToggleConsumerProps> {
  @override
  render() {
    return ToggleContext.Consumer()(
      (value) {
        if (value == null) {
          throw new Exception('Toggle compound components cannot be rendered outside the Toggle component');
        }
        return props.children.single(value);
      },
    );
  }
}
