import 'package:over_react/over_react.dart';

part 'component_container.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ComponentContainerProps> ComponentContainer = castUiFactory(_$ComponentContainer);

mixin ComponentContainerProps on UiProps {
  String label;
}

class ComponentContainerComponent extends UiComponent2<ComponentContainerProps> {
  @override
  render() {
    return (Dom.div()..style = {'display': 'flex', 'flexDirection': 'column'})(
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
    );
  }
}
