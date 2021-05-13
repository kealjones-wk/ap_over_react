// 11: The provider pattern
// Extra credit: avoid unecessary re-renders by only updating the value when
// state changes

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/2/layer_2.dart';

part 'layer_1.over_react.g.dart';

// Don't make changes to the Layer1 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<Layer1Props> Layer1 = castUiFactory(_$Layer1);

class Layer1Props = UiProps with SharedTogglePropsMixin;

class Layer1Component extends UiComponent2<Layer1Props> {
  @override
  get consumedProps => [];

  @override
  render() => Layer2()();
}
