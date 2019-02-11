import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends AbstractToggleProps {

}

@State()
class _$ToggleState extends UiState {

}

@Component()
class ToggleComponent extends UiStatefulComponent<ToggleProps, ToggleState> {

// The `withToggle` function is called a "Higher Order Component"
// It's another way to share code and allows you to statically
// create new components to render.
// The basic idea is you create a new component that renders the
// component the HOC is given.
//
// This presents a few issues that we'll have to deal with in our
// component.
//
// 1. 🐨 create and return a function component called "Wrapper" which renders
//    a <Toggle.Consumer> with a child function that renders <Component />
//    with the props Wrapper is given as well as a toggle prop
// 2. 🐨 Handle `ref`s properly by using React.forwardRef:
//    https://reactjs.org/docs/forwarding-refs.html
//    💰 You can make your Wrapper function accept a second argument called
//    `ref` and `return React.forwardRef(Wrapper)` instead of the
//    `return Component` we already have above.
// 3. 🐨 Make it easier to debug using the React DevTools by setting a
//    useful `displayName` property on the Wrapper.
//    💰 `Wrapper.displayName = ...`
// 4. 🐨 Use the `hoistNonReactStatics` function (uncomment the imported above)
//    by calling it with the Wrapper and the Component to forward all the
//    static properties from the Component to the Wrapper
//    💰 `return hoistReactStatics(React.forwardRef(Wrapper), Component)`

}