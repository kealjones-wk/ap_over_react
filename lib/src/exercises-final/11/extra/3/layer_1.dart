// 11: The provider pattern
// Extra credit: support render props

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/3/layer_2.dart';

// ignore: uri_has_not_been_generated
part 'layer_1.over_react.g.dart';

// Don't make changes to the Layer1 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
@Factory()
// ignore: undefined_identifier
UiFactory<Layer1Props> Layer1 = _$Layer1;

@Props()
class _$Layer1Props extends AbstractToggleProps {}

@Component2()
class Layer1Component extends UiComponent2<Layer1Props> {
  @override
  render() => Layer2()();
}
