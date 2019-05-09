import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/app_components/error_boundary.dart' as local;

// ignore: uri_has_not_been_generated
part 'component_container.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ComponentContainerProps> ComponentContainer = _$ComponentContainer;

@Props()
class _$ComponentContainerProps extends UiProps {
  String label;
}

@Component2()
class ComponentContainerComponent extends UiComponent2<ComponentContainerProps> {
  @override
  render() {
    return local.ErrorBoundary()(
      (Dom.div()..style = {'display': 'flex', 'flexDirection': 'column'})(
      (Dom.h2()..style = {'textAlign': 'center'})(props.label),
      (Dom.div()
        ..style = {
          'flex': 1,
          'padding': 20,
          'border': '1px solid',
          'display': 'grid',
          'alignItems': 'center',
          'justifyContent': 'center',
        }
      )(props.children),
    )
    );
  }
}
