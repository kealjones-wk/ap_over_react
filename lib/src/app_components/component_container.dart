import 'package:over_react/over_react.dart';

part 'component_container.over_react.g.dart';

mixin ComponentContainerProps on UiProps {
  String label;
}

UiFactory<ComponentContainerProps> ComponentContainer = uiFunction(
  (props) {
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
  },
  _$ComponentContainerConfig, // ignore: undefined_identifier
);
