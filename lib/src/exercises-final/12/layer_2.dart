// 12: Higher order components

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/polyfills/fragment.dart';
import 'package:ap_over_react/src/exercises-final/12/context.dart';
import 'package:ap_over_react/src/exercises-final/12/layer_3.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/12/toggle.dart';

// ignore: uri_has_not_been_generated
part 'layer_2.over_react.g.dart';

// Don't make changes to the Layer2 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
@Factory()
// ignore: undefined_identifier
UiFactory<Layer2Props> Layer2 = _$Layer2;

@Props()
class _$Layer2Props extends AbstractToggleProps {}

@Component()
class Layer2Component extends UiComponent<Layer2Props> {
  @override
  render() {
    return ToggleComponent.withToggle(
      Fragment()(
        Layer3()(),
      )
    );
  }
}
