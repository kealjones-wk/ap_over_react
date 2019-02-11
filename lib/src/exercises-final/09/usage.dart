// 05: Prop Collections

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/09/toggle.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

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
}

@State()
class _$UsageState extends UiState {
  // Wether the toggle is On or Off
  int timesClicked;
}

@Component()
class UsageComponent extends UiStatefulComponent<UsageProps, UsageState> {
  @override
  Map getDefaultProps() => newProps()
      ..onToggle = (args) {
        print('onToggle $args');
      }
      ..onReset = (args) {
        print('onReset $args');
      };

  @override
  Map getInitialState() => newState()..timesClicked = 0;

  handleToggle(args) {
    setState(newState()..timesClicked = state.timesClicked++);
    props.onToggle(args);
  }

  handleReset(args) {
    setState(getInitialState());
    props.onReset(args);
  }

  toggleStateReducer(state, changes) {
    if (changes['type'] == 'forced') {
      return changes;
    }
    if (this.state.timesClicked >= 4) {
      return BaseToggleProps()
          ..addProps(changes)
          ..isOn = false;
    }
    return changes;
  }

  @override
  render() {
    return (Toggle()
        ..stateReducer = toggleStateReducer
        ..onToggle = handleToggle
        ..onReset = handleReset
      )(
      (BaseToggleProps value) {
        return Dom.div()(
          (Switch()
            ..getTogglerProps(BaseToggleProps()..isOn = value.isOn
          )(
            state.timesClicked > 4 ? (
              (Dom.div()..addTestId('notice'))(
                Dom.br()(),
                (Dom.button()..onClick = (_) { value.toggle({'type': 'forced'});})(
                  'Force Toggle'
                ),
                Dom.br()(),
              )
            ) : state.timesClicked > 0 ?
                (Dom.div()..addTestId('click-count'))(
                  'Click count: ${state.timesClicked}'
                )
              : null,
              (Dom.button()..onClick = value.reset)(
                'Reset'
              )
            )
          ),
        );
      }
    );
  }
}
