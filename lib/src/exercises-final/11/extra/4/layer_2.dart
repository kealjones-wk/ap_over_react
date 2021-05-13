// 11: The provider pattern
// Extra credit: support (and expose) compound components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/4/layer_3.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/4/toggle.dart';

part 'layer_2.over_react.g.dart';

// Don't make changes to the Layer2 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<Layer2Props> Layer2 = castUiFactory(_$Layer2);

class Layer2Props = UiProps with SharedTogglePropsMixin;

class Layer2Component extends UiComponent2<Layer2Props> {
  @override
  get consumedProps => [];

  @override
  render() {
    return Fragment()(
      ToggleComponent.On('The button is on'),
      ToggleComponent.Off('The button is off'),
      Layer3()(),
    );
  }
}
