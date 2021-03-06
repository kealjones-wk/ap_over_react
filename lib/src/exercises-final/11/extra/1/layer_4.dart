// 11: The provider pattern
// Extra credit: Validate the consumer is rendered within a provider

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/1/toggle_consumer.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'layer_4.over_react.g.dart';

// Don't make changes to the Layer4 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
@Factory()
// ignore: undefined_identifier
UiFactory<Layer4Props> Layer4 = _$Layer4;

@Props()
class _$Layer4Props extends AbstractToggleProps {}

@Component()
class Layer4Component extends UiComponent<Layer4Props> {
  @override
  render() {
    return ToggleConsumer()(
      (BaseToggleProps value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }
}
