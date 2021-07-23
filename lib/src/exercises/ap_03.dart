// 03: Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'ap_03.over_react.g.dart';
// Right now our component can only clone and pass props to immediate children.
// So we need some way for our compound components to implicitly accept the on
// state and toggle method regardless of where they're rendered within the
// Toggle component's 'posterity' :)
//
// The way we do this is through context. React.createContext is the API we
// want. Here's a simple example of that API:
//
// const defaultValue = 'light'
// const ThemeContext = React.createContext(defaultValue)
//   Note: The `defaultValue` can be an object, function, or anything.
//   It's simply what React will use if the ThemeContext.Consumer is rendered
//   outside a ThemeContext.Provider
//
// ...
// <ThemeContext.Provider value={this.state}>
//   {this.props.children}
// </ThemeContext.Provider>
// ...
//
// ...
// <ThemeContext.Consumer>
//   {contextValue => <div>The current theme is: {contextValue}</div>}
// </ThemeContext.Consumer>
// ...
//
// NOTE: Spacing matters!! For example, these are not the same:
// <Context.Consumer> {val => val} </Context.Consumer>
// <Context.Consumer>{val => val}</Context.Consumer>
//
// To visualize the difference, here's what these would be with a named children prop:
// <Context.Consumer children={[' ', {val => val}, ' ']} />
// <Context.Consumer children={val => val} />
// make sure that you don't have the extra space in there
//   (newlines are ok, like in the above example)

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

final ToggleContext = createContext<ToggleState>();

mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  void Function(bool isOn) onToggle;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
  Function toggle;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  // 🐨 each of these compound components will need to be changed to use
  // ToggleContext.Consumer and rather than getting `on` and `toggle`
  // from props, it'll get it from the ToggleContext.Consumer value.

  void toggle(_) {
    setState(
        (newState()..isOn = !state.isOn), () => props.onToggle(state.isOn)
      );
  }

  @override
  get initialState => (newState()
    ..isOn = false
    ..toggle = toggle
    );

  static ReactElement On(dynamic children) {
    return ToggleContext.Consumer()(
      (value) {
        if (value == null) {
          throw Exception(
              'Compound components may not be rendered outside the Toggle');
        } else {
          return value.isOn ? children : null;
        }
      },
    );
  }

  static ReactElement Off(dynamic children) {
    return ToggleContext.Consumer()(
      (value) {
      if (value == null) {
        throw Exception(
            'Compound components may not be rendered outside the Toggle');
      } else {
        return value.isOn ? null : children;
      }
    });
  }

  static ReactElement Button() {
    return ToggleContext.Consumer()(
      (value) {
      if (value == null) {
        throw Exception(
            'Compound components may not be rendered outside the Toggle');
      } else {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle)();
      }
    });
  }

  @override
  render() {
    return (ToggleContext.Provider()..value = state)(
      props.children,
    );
  }
}

// 💯 Extra credit: rather than having a default value, make it so the consumer
// will throw an error if there's no context value to make sure people don't
// attempt to render one of the compound components outside the Toggle. ✅
// 💯 Extra credit: avoid unnecessary re-renders of the consumers by not
// creating a new `value` object ever render and instead passing an object
// which only changes when the state changes. ✅

// Don't make changes to the Usage component. It's here to show you how your
// component is intended to be used and is used in the tests.
// You can make all the tests pass by updating the Toggle component.
UiFactory<UsageProps> Usage = uiFunction(
  (props) {
    final onToggle = props.onToggle ?? (isOn) => print('onToggle $isOn');
    return (Toggle()..onToggle = onToggle)(
      ToggleComponent.On('The button is on'),
      ToggleComponent.Off('The button is off'),
      ToggleComponent.Button(),
    );
  },
  _$UsageConfig, // ignore: undefined_identifier
);

mixin UsageProps on UiProps {
  void Function(bool isOn) onToggle;
}
