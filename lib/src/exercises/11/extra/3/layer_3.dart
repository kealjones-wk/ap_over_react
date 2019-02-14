// 11: The provider pattern

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/3/layer_4.dart';

// ignore: uri_has_not_been_generated
part 'layer_3.over_react.g.dart';

// Don't make changes to the Layer3 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
@Factory()
// ignore: undefined_identifier
UiFactory<Layer3Props> Layer3 = _$Layer3;

@Props()
class _$Layer3Props extends AbstractToggleProps {}

@Component()
class Layer3Component extends UiComponent<Layer3Props> {
  @override
  render() => Layer4()();
}
