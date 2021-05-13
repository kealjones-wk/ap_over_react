// 11: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises/11/context.dart';
import 'package:ap_over_react/src/exercises/11/layer_3.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'layer_2.over_react.g.dart';

// Don't make changes to the Layer2 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
@Factory()
// ignore: undefined_identifier
UiFactory<Layer2Props> Layer2 = _$Layer2;

// FIXME: `Layer2Props` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props()
class _$Layer2Props extends AbstractToggleProps {}

@Component2()
class Layer2Component extends UiComponent2<Layer2Props> {
  @override
  render() {
    return ToggleContext.Consumer()(
      (value) {
        return Fragment()(
          value.isOn ? 'The button is on' : 'The button is off',
          Layer3()(),
        );
      },
    );
  }
}
