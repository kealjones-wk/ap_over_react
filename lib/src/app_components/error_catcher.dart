import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'error_catcher.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ErrorCatcherProps> ErrorCatcher = _$ErrorCatcher;

@Props()
class _$ErrorCatcherProps extends UiProps {}

@State()
class _$ErrorCatcherState extends UiState {
  dynamic error;
}

@Component()
class ErrorCatcherComponent
    extends UiStatefulComponent<ErrorCatcherProps, ErrorCatcherState> {
  getDerivedStateFromProps() {
    // if the props change then let's try rendering again...
    return newState()..error = null;
  }

  handleError(error, info) {
    print(error);
    print(info);
    setState(newState()..error = error);
  }

  @override
  render() {
    return (Dom.div()..addProps(copyUnconsumedDomProps()))(
      state.error != null
          ? 'There was an error. Edit the code and try again.'
          : props.children,
    );
  }
}
