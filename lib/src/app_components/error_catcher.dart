import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'error_catcher.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ErrorCatcherProps> ErrorCatcher = _$ErrorCatcher;

@Props()
class _$ErrorCatcherProps extends UiProps {

}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ErrorCatcherProps extends _$ErrorCatcherProps with _$ErrorCatcherPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForErrorCatcherProps;
}

@State()
class _$ErrorCatcherState extends UiState {
  Object error;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ErrorCatcherState extends _$ErrorCatcherState with _$ErrorCatcherStateAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const StateMeta meta = _$metaForErrorCatcherState;
}

@Component()
class ErrorCatcherComponent extends UiStatefulComponent<ErrorCatcherProps, ErrorCatcherState> {
  getDerivedStateFromProps() {
    // if the props change then let's try rendering again...
    return (newState()..error = null);
  }

  componentDidCatch(error, info) {
    print(error);
    print(info);
    setState(newState()..error = error);
  }

  render() {
    return (
      (Dom.div()
        ..addProps(copyUnconsumedDomProps())
      )(state.error
          ? 'There was an error. Edit the code and try again.'
          : props.children)
      );
  }
}
