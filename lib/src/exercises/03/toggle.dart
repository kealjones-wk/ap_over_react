// Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';
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

// 🐨 create a ToggleContext with React.createContext here

///var ToggleContext = createContext();

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

@State()
class _$ToggleState extends UiState {
  // Wether the toggle is On or Off
  bool isOn;
}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {
  // In OverReact we dont yet support functional components (maybe soon!).
  // So this tutorial is a little more verbose than the video will go though.
  // SubComponents are handy because it makes the relationship between the
  // parent Toggle component and the child component more explicit
  // 🐨 You'll need to create three such components here: ToggleOn, ToggleOff, and ToggleButton
  //    The button will be responsible for rendering the <Switch /> (with the right props)
  // 💰 Combined with changes you'll make in the `render` method, these should
  //    be able to accept `on`, `toggle`, and `children` as props.
  //    Note that they will _not_ have access to Toggle instance properties
  //    like `this.state.on` or `this.toggle`. The base files for the OverReact components
  //    have been setup and imported to the usage file already. You just need to go and update them:
  //    src/exercises/02/button.dart
  //    src/exercises/02/on.dart
  //    src/exercises/02/off.dart
  @override
  Map getInitialState() => newState()..isOn = false;

  void toggle(_) {
    setState(newState()..isOn = !state.isOn, () => props.onToggle(state.isOn));
  }

  @override
  render() {
    // we're trying to let people render the components they want within the Toggle component.
    // But the ToggleOn, ToggleOff, and ToggleButton components will need access to the internal `isOn` state as
    // well as the internal `toggle` function for them to work properly. So here we can
    // take all props.children and make a copy of them that has those props.
    //
    // To do this, you can use:
    // 1. props.children.map
    // 2. cloneElement: https://pub.dartlang.org/documentation/over_react/1.24.1/over_react/cloneElement.html
    //
    // 🐨 you'll want to completely replace the code below with the above logic.
    return false;
    /*(Switch()
      ..isOn = state.isOn
      ..onClick = toggle
    )();*/
  }
}

// Ignore everything below here: its just temporary dart2 compatibility stuff...

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleProps extends _$ToggleProps with _$TogglePropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForToggleProps;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ToggleState extends _$ToggleState with _$ToggleStateAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const StateMeta meta = _$metaForToggleState;
}
