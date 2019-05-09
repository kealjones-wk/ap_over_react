import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'error_boundary.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ErrorBoundaryProps> ErrorBoundary = _$ErrorBoundary;

@Props()
class _$ErrorBoundaryProps extends UiProps {
}

@State()
class _$ErrorBoundaryState extends UiState {
  bool didCatchError;
}

@Component2()
class ErrorBoundaryComponent extends UiStatefulComponent2<ErrorBoundaryProps, ErrorBoundaryState> {
  @override
  init(){
    this.state = JsBackedMap.from({'didCatchError': false});
  }

  @override
  getDerivedStateFromError(dynamic error){
    return JsBackedMap.from({'didCatchError': true});
  }

  @override
  render() {
    if (state.didCatchError == true){
      return 'Looks like something is wrong!';
    }
    return props.children;
  }
}
