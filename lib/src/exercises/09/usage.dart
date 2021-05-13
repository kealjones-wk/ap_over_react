// 09: state reducer with types

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises/09/toggle.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/switch.dart';

part 'usage.over_react.g.dart';

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = castUiFactory(_$Usage);

@Props(keyNamespace: '')
mixin UsageProps on UiProps {
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
}

@State(keyNamespace: '')
mixin UsageState on UiState {
  int timesClicked;
}

class UsageComponent extends UiStatefulComponent2<UsageProps, UsageState> {
  @override
  get defaultProps => (newProps()
    ..onToggle = (args) {
      print('onToggle $args');
    }
    ..onToggleReset = (args) {
      print('onToggleReset $args');
    }
  );

  @override
  get initialState => (newState()..timesClicked = 0);

  handleToggle(args) {
    setState((newState()..timesClicked = state.timesClicked++));
    props.onToggle(args);
  }

  handleReset(args) {
    setState(getInitialState());
    props.onToggleReset(args);
  }

  Map toggleStateReducer(Map newState, Map changes) {
    if (changes['type'] == 'forced') {
      return SharedTogglePropsMapView()..addAll(changes);
    }
    if (state.timesClicked >= 4) {
      return SharedTogglePropsMapView()
        ..addAll(changes)
        ..isOn = false;
    }
    return changes;
  }

  @override
  render() {
    return (Toggle()
      ..stateReducer = toggleStateReducer
      ..onToggle = handleToggle
      ..onToggleReset = handleReset
      ..ref = (ref) {
        props.ref = ref;
      }
    )(
      (value) {
        return Dom.div()(
          (Switch()..addProps(value.getTogglerProps(SharedTogglePropsMapView()..isOn = value.isOn)))(),
          state.timesClicked > 4
              ? ((Dom.div()..addTestId('notice'))(
                  'Whoa, you clicked too much!',
                  Dom.br()(),
                  (Dom.button()
                    ..onClick = (_) {
                      value.toggle({'type': 'forced'});
                    }
                  )('Force Toggle'),
                  Dom.br()(),
                ))
              : state.timesClicked > 0
                  ? ((Dom.div()..addTestId('click-count'))(
                      'Click count: ${state.timesClicked}',
                    ))
                  : null,
          (Dom.button()
            ..onClick = (_) {
              value.reset();
            }
          )('Reset'),
        );
      },
    );
  }
}
