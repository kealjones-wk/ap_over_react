// 11: The provider pattern
// Extra credit: support (and expose) compound components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/4/toggle.dart';

part 'layer_4.over_react.g.dart';

// Don't make changes to the Layer4 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<Layer4Props> Layer4 = castUiFactory(_$Layer4);

class Layer4Props = UiProps with SharedTogglePropsMixin;

class Layer4Component extends UiComponent2<Layer4Props> {
  @override
  get consumedProps => [];

  @override
  render() {
    return ToggleComponent.Button();
  }
}
