// 11: The provider pattern
// Extra credit: support (and expose) compound components

// ignore_for_file: avoid_types_on_closure_parameters
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'ap_11.extra_4.over_react.g.dart';

final tDefaultValue = SharedTogglePropsMapView()
  ..isOn = false
  ..toggle = (_) {
    print('context default onClick');
  };
final ToggleContext = createContext(tDefaultValue);

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
  void Function(bool isOn) toggle;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()
    ..isOn = false
    ..toggle = toggle
  );

  void toggle(_) => setState(newState()..isOn = !state.isOn, () => props.onToggle(state.isOn));

  static final Consumer = ToggleConsumer;

  static ReactElement On(dynamic children) {
    return Consumer()(
      (SharedTogglePropsMixin value) {
        return value.isOn ? children : null;
      },
    );
  }

  static ReactElement Off(dynamic children) {
    return Consumer()(
      (SharedTogglePropsMixin value) {
        return value.isOn ? null : children;
      },
    );
  }

  static ReactElement Button() {
    return Consumer()(
      (SharedTogglePropsMixin value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }

  @override
  render() {
    final dynamic children = props.children;
    final ui = children is Function ? children(state) : children;

    return (ToggleContext.Provider()
      ..value = (SharedTogglePropsMapView()
        ..isOn = state.isOn
        ..toggle = toggle)
    )(ui);
  }
}

mixin ToggleConsumerProps on UiProps {}

UiFactory<ToggleConsumerProps> ToggleConsumer = uiFunction(
  (props) {
    return ToggleContext.Consumer()(
      (value) {
        if (value == null) {
          throw Exception('Toggle compound components cannot be rendered outside the Toggle component');
        }
        return props.children.single(value);
      },
    );
  },
  _$ToggleConsumerConfig, // ignore: undefined_identifier
);

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');

    return (Toggle()..onToggle = onToggle)(
      Layer1()(),
    );
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
}

// Don't make changes to the Layer1 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
// ignore: undefined_identifier
UiFactory<Layer1Props> Layer1 = uiFunction(
  (props) => Layer2()(),
  _$Layer1Config, // ignore: undefined_identifier
);

class Layer1Props = UiProps with SharedTogglePropsMixin;

// Don't make changes to the Layer2 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
// ignore: undefined_identifier
UiFactory<Layer2Props> Layer2 = uiFunction(
  (props) {
    return ToggleComponent.Consumer()(
      // ignore: avoid_types_on_closure_parameters
      (SharedTogglePropsMixin value) {
        return Fragment()(
          ToggleComponent.On('The button is on'),
          ToggleComponent.Off('The button is off'),
          Layer3()(),
        );
      },
    );
  },
  _$Layer2Config, // ignore: undefined_identifier
);

class Layer2Props = UiProps with SharedTogglePropsMixin;

// Don't make changes to the Layer3 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
// ignore: undefined_identifier
UiFactory<Layer3Props> Layer3 = uiFunction(
  (props) => Layer4()(),
  _$Layer3Config, // ignore: undefined_identifier
);

class Layer3Props = UiProps with SharedTogglePropsMixin;

// Don't make changes to the Layer4 component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
// ignore: undefined_identifier
// ignore: undefined_identifier
UiFactory<Layer4Props> Layer4 = uiFunction(
  (props) => ToggleComponent.Button(),
  _$Layer4Config, // ignore: undefined_identifier
);

class Layer4Props = UiProps with SharedTogglePropsMixin;
