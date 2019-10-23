// 10: control props

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/10/toggle.dart';

// ignore: uri_has_not_been_generated
part 'usage.over_react.g.dart';

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
@Factory()
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = _$Usage;

@Props()
class _$UsageProps extends UiProps {
  Callback1Arg onToggle;
  dynamic toggle1Ref;
  dynamic toggle2Ref;
}

@State()
class _$UsageState extends UiState {
  // Whether the toggle is On or Off
  bool bothOn;
}

@Component2()
class UsageComponent extends UiStatefulComponent2<UsageProps, UsageState> {
  @override
  get initialState => (newState()..bothOn = false);

  handleToggle(isOn) => setState((newState()..bothOn = isOn));

  @override
  render() {
    var toggle1Ref = props.toggle1Ref;
    var toggle2Ref = props.toggle2Ref;

    return Dom.div()(
      (Toggle()
        ..isOn = state.bothOn
        ..onToggle = handleToggle
        ..ref = (ref) {
          toggle1Ref = ref;
        }
      )(),
      (Toggle()
        ..isOn = state.bothOn
        ..onToggle = handleToggle
        ..ref = (ref) {
          toggle2Ref = ref;
        }
      )(),
    );
  }
}
