// 09: state reducer with types

// ignore_for_file: avoid_positional_boolean_parameters
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'ap_09.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  bool initialOn;
  void Function(bool isOn) onToggle;
  void Function(bool isOn) onToggleReset;
  Map Function(Map state, Map changes) stateReducer;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

@State(keyNamespace: '')
mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get defaultProps => (newProps()
    ..initialOn = false
    ..onToggleReset = (_) {}
    ..stateReducer = (state, changes) => changes
  );
  // 💰 any time I use a string as an identifier for a type,
  // I prefer to give it a variable name. That way folks who
  // want to reference the type can do so using variable which
  // will help mitigate the problems of indirection.
  static const stateChangeTypes = {
    'reset': '__toggle_reset__',
    'toggle': '__toggle_toggle__',
  };

  @override
  get initialState => (newState()..isOn = props.initialOn);

  void internalSetState(dynamic changes, Function() callback) {
    Map getNewState(changes) {
      // handle function setState call
      final changesObject = ((changes is Function) ? changes(state) : changes) as ToggleState;

      // apply state reducer
      final reducedChanges = props.stateReducer(state, changesObject) ?? const {};

      // remove the type so it's not set into state
      if (reducedChanges.containsKey('type')) {
        reducedChanges.remove('type');
      }

      return reducedChanges;
    }

    final newState = getNewState(changes);
    if (newState.isEmpty) return;

    setState(newState, callback);
  }

  void reset() {
    internalSetState(
      initialState..['type'] = stateChangeTypes['reset'],
      () => props.onToggleReset(state.isOn),
    );
  }

  void toggle([Map map]) {
    var type = stateChangeTypes['toggle'];
    if (map != null && map.containsKey('type')) {
      type = map['type'];
    }
    internalSetState(
      newState()
        ..['type'] = type
        ..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  SharedTogglePropsMixin getTogglerProps([SharedTogglePropsMixin additionalProps]) {
    additionalProps ??= SharedTogglePropsMapView();

    return SharedTogglePropsMapView()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = (event) {
        toggle();
        additionalProps.onClick?.call(event);
      };
  }

  @override
  render() {
    return props.children.single(SharedTogglePropsMapView()
      ..isOn = state.isOn
      ..toggle = toggle
      ..reset = reset
      ..getTogglerProps = getTogglerProps);
  }
}

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
UiFactory<UsageProps> Usage = uiForwardRef(
  (props, ref) {
    final onToggleReset = props.onToggleReset ?? (isOn) => print('onToggleReset $isOn');
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');
    final timesClicked = useState(0);

    void handleToggle(bool isOn) {
      timesClicked.setWithUpdater((t) => t + 1);
      onToggle(isOn);
    }

    void handleReset(bool isOn) {
      timesClicked.set(0);
      onToggleReset(isOn);
    }

    renderer(SharedTogglePropsMixin value) {
      return Dom.div()(
        (Switch()..addProps(value.getTogglerProps(SharedTogglePropsMapView()..isOn = value.isOn)))(),
        timesClicked.value > 4
            ? (Dom.div()..addTestId('notice'))(
                'Whoa, you clicked too much!',
                Dom.br()(),
                (Dom.button()
                  ..onClick = (_) {
                    value.toggle({'type': 'forced'});
                  }
                )('Force Toggle'),
                Dom.br()(),
              )
            : (Dom.div()..addTestId('click-count'))(
                'Click count: ${timesClicked.value}',
              ),
        (Dom.button()
          ..onClick = (_) {
            value.reset();
          }
        )('Reset'),
      );
    }

    Map toggleStateReducer(Map newState, Map changes) {
      if (changes['type'] == 'forced') {
        return SharedTogglePropsMapView()..addAll(changes);
      }
      if (timesClicked.value >= 4) {
        return SharedTogglePropsMapView()
          ..addAll(changes)
          ..isOn = false;
      }
      return changes;
    }

    return (Toggle()
      ..stateReducer = toggleStateReducer
      ..onToggle = handleToggle
      ..onToggleReset = handleReset
      ..ref = ref
    )(renderer);
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
  void Function(bool isOn) onToggleReset;
}
