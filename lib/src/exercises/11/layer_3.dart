// 11: The provider pattern

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/layer_4.dart';

part 'layer_3.over_react.g.dart';

// Don't make changes to the Layer3 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<Layer3Props> Layer3 = castUiFactory(_$Layer3);

class Layer3Props = UiProps with SharedTogglePropsMixin;

class Layer3Component extends UiComponent2<Layer3Props> {
  @override
  get consumedProps => [];

  @override
  render() => Layer4()();
}
