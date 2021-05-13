// 11: The provider pattern
// Extra credit: support (and expose) compound components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/4/layer_4.dart';

part 'layer_3.over_react.g.dart';

// Don't make changes to the Layer3 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
@Factory()
// ignore: undefined_identifier
UiFactory<Layer3Props> Layer3 = _$Layer3;

// FIXME: `Layer3Props` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props()
class _$Layer3Props extends AbstractToggleProps {}

@Component2()
class Layer3Component extends UiComponent2<Layer3Props> {
  @override
  render() => Layer4()();
}
